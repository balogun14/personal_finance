import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/new_transaction.dart';
import 'package:personal_finance/widgets/transaction_list.dart';

import '../modules/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'Shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'Travels', amount: 10.6, date: DateTime.now()),
    Transaction(id: 't3', title: 'Bag', amount: 70.4, date: DateTime.now()),
    Transaction(id: 't4', title: 'Food', amount: 50.4, date: DateTime.now()),
    Transaction(id: 't5', title: 'Clothes', amount: 60, date: DateTime.now()),
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
    print(title);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          add: _addNewTransaction,
        ),
        TransactionList(userTransaction: _userTransaction),
      ],
    );
  }
}
