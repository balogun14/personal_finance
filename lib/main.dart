// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:personal_finance/widgets/new_transaction.dart';
import 'package:personal_finance/widgets/transaction_list.dart';
import 'modules/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
      title: 'Personal Finance',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(add: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Personal Finance')),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.blue,
              elevation: 5,
              child: Container(
                width: double.infinity,
                child: Text('CHART'),
              ),
            ),
           TransactionList(userTransaction: _userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>_startAddNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
