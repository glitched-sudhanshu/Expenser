import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransactionHandler;

  TransactionList(this._userTransactions, this._deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, position) {
                Transaction tx = _userTransactions[position];
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text(
                            '₹${tx.amount.toStringAsFixed(0)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tx.title.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(tx.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () {_deleteTransactionHandler(tx.id);},
                    ),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}

// Row(
// children: [
// Container(
// margin:
// EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// decoration: BoxDecoration(
// border: Border.all(
// color: Colors.purple,
// width: 2,
// ),
// ),
// padding: EdgeInsets.all(10),
// child: Text(
// '₹ ${tx.amount.toStringAsFixed(2)} /-',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: Colors.purple,
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(tx.title.toString(),
// style: Theme.of(context).textTheme.titleMedium),
// Text(
// DateFormat.yMMMMd().format(tx.date),
// style: TextStyle(
// fontSize: 14,
// color: Colors.blueGrey,
// ),
// ),
// ],
// ),
// ],
// ),
// );
