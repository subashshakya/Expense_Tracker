import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 42.0,
        date: DateTime.now()),
    Transaction(
        id: 't3', title: 'HDMI cable', amount: 16.99, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Keyboard', amount: 12.50, date: DateTime.now())
  ];

  // String titleInput = '';
  // String amount = '';

  final titleController =
      TextEditingController(); //we dont need to write logic for saving the text
  final amountController = TextEditingController(); //when we use this class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 50,
                    child: Text('CHART')),
                elevation: 5,
              ),
              Card(
                  elevation: 10,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          TextField(
                              decoration: InputDecoration(labelText: 'Title'),
                              // onChanged: (String value) {
                              //   titleInput = value;
                              // },
                              controller: titleController),
                          TextField(
                              decoration: InputDecoration(labelText: 'Amount'),
                              // onChanged: (value) {
                              //   amount = value;
                              // }),
                              controller: amountController),
                          ElevatedButton(
                              child: Text('Add Transaction'),
                              onPressed: () {
                                print(titleController.text);
                                print(amountController.text);
                              })
                        ],
                      ))),
              Column(
                children: transactions.map((tx) {
                  return Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('\$${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            )),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(tx.title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(DateFormat.yMd().add_jm().format(tx.date),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ])
                    ],
                  ));
                }).toList(),
              ),
            ]));
  }
}
