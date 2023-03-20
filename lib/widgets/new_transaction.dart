import 'package:expense_app/utils/StringUtil.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _newTransactionHandler;

  NewTransaction(this._newTransactionHandler);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();

  void _submitTransaction() {
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) return;

    final capitalizedEnteredTitle = enteredTitle.capitalize();

    widget._newTransactionHandler(capitalizedEnteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              style: TextStyle(fontWeight: FontWeight.normal),
              controller: titleInput,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount',),
              style: TextStyle(fontWeight: FontWeight.normal),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen!'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitTransaction,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
