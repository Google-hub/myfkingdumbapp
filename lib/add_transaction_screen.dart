// ignore_for_file: prefer_const_constructors, unnecessary_import, duplicate_import, implementation_imports, unused_import, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:myfkingdumbapp/transactions_data.dart';
import 'dataType.dart';

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
              TransactionData.transaction_History.add(newsTransaction);
              Navigator.of(context).pop();
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
