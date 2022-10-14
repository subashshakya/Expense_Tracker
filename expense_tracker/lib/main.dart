import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

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
        body: SingleChildScrollView(
            child: Column(
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
              UserTransaction()
            ])));
  }
}
