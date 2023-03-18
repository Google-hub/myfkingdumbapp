// ignore_for_file: prefer_const_constructors, unnecessary_import, duplicate_import, implementation_imports, unused_import, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'dataType.dart';
// import 'transaction_history_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class addTransaction_Screen extends StatelessWidget {
  const addTransaction_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    var titleController = TextEditingController();
    var dateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Thêm thu chi mới"),
        actions: [
          IconButton(
            onPressed: () {
              var newsTransaction = TransactionType(int.parse(amountController.text), titleController.text, dateController.text);
              Navigator.of(context).pop(newsTransaction);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Tiêu đề"),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("Số tiền"),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Text("Ngày"),
          TextField(
            controller: dateController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
