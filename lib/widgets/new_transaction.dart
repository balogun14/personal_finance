// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key, required this.add});

  final Function add;
 
  TextEditingController amountInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();

  void submitData() {
    add(titleInput.text, double.parse(amountInput.text));
    if (amountInput == 0 || titleInput == 0) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleInput,
              onSubmitted: (_) {
                submitData;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submitData;
              },
            ),
            TextButton(
              onPressed: submitData,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple)),
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
