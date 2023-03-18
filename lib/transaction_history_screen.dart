// ignore_for_file: prefer_const_constructors, unnecessary_import, duplicate_import, implementation_imports, unused_import, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myfkingdumbapp/add_transaction_screen.dart';
import 'dataType.dart';

class Transaction_Screen extends StatefulWidget {
  const Transaction_Screen({super.key});

  @override
  State<Transaction_Screen> createState() => _Transaction_ScreenState();
}

class _Transaction_ScreenState extends State<Transaction_Screen> {
  static var transaction_History = [
    TransactionType(100, "Mừng sinh nhật - Mẹ cho", "19/03/2023"),
    TransactionType(20000, "Mừng sinh nhật - Mẹ cho", "19/03/2023"),
    TransactionType(-20150, "Sài lung tung", "19/03/2023"),
    TransactionType(-20100, "Sài lung tung", "19/03/2023"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý chi tiêu'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => addTransaction_Screen())).then((value) {
                  setState(() {
                    transaction_History.add(value);
                  });
                });
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < transaction_History.length; i++)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListTile(
                        leading: Text(
                          transaction_History[i].amount > 0 ? '+${transaction_History[i].amount}k' : '${transaction_History[i].amount}k',
                          style: TextStyle(
                            color: transaction_History[i].amount > 0 ? Colors.green : Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          child: Text(transaction_History[i].context, style: TextStyle(fontSize: 18)),
                        ),
                        subtitle: Text(transaction_History[i].date),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  transaction_History.removeAt(i);
                                });
                              },
                              icon: Icon(Icons.delete_forever),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        )),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
