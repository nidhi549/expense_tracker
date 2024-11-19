import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';

class AddExpenseScreen extends StatelessWidget {
  final ExpenseController controller = Get.find<ExpenseController>();
  final categoryController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addExpense(
                  categoryController.text,
                  double.parse(amountController.text),
                );
                Get.back();
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
