import 'package:expense_app/models/weekly.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/widgets/chartBar.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<WeeklyDay> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      WeeklyDay wd = WeeklyDay(
          DateFormat.E().format(weekDay).toString().substring(0, 1),
          double.parse(totalSum.toStringAsFixed(2)));
      return wd;
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (curSum, item) {
      return curSum + (item.amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return
              Flexible(
              fit: FlexFit.tight,
              child:
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ChartBar(
                    data.weekDay,
                    data.amount,
                    totalSpending == 0.0 ? 0.0 : (data.amount) / totalSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
