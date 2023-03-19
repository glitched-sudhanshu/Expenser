import 'package:expense_app/Util/StringUtil.dart';
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

  void _submitTransaction(){
    final enteredTitle = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if(enteredTitle.isEmpty || enteredAmount<0) return;

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
              controller: titleInput,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextButton(
              onPressed: _submitTransaction,
              child: Text('Add Transaction'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Theme.of(context).primaryColor.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Theme.of(context).primaryColor.withOpacity(0.12);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
