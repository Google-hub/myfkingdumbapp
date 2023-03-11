// ignore_for_file: prefer_const_constructors, unnecessary_import, duplicate_import, implementation_imports, unused_import, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myfkingdumbapp/add_transaction_screen.dart';
import 'dataType.dart';
import 'transactions_data.dart';

class Transaction_Screen extends StatefulWidget {
  const Transaction_Screen({super.key});

  @override
  State<Transaction_Screen> createState() => _Transaction_ScreenState();
}

class _Transaction_ScreenState extends State<Transaction_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý chi tiêu'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => addTransaction_Screen())).then((value) {
                  setState(() {});
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
              children: TransactionData.transaction_History
                  .map(
                    (item) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ListTile(
                          leading: Text(
                            item.amount > 0 ? '+${item.amount}k' : '${item.amount}k',
                            style: TextStyle(
                              color: item.amount > 0 ? Colors.green : Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            child: Text(item.context, style: TextStyle(fontSize: 18)),
                          ),
                          subtitle: Text(item.date),
                          trailing: IconButton(
                              onPressed: () {
                                // TransactionData.transaction_History.();
                              },
                              icon: Icon(Icons.delete_forever)),
                        ),
                      ),
                    ),
                  )
                  .toList()
              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(16),
              //     child: Text('Ăn sáng 20k'),
              //   ),
              // ),

              ),
        ),
      ),
    );
  }
}
