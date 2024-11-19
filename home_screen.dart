import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  final ExpenseController controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.expenses.length,
          itemBuilder: (context, index) {
            final expense = controller.expenses[index];
            return ListTile(
              title: Text('${expense.category} - \$${expense.amount.toStringAsFixed(2)}'),
              subtitle: Text('${expense.date.toLocal()}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.deleteExpense(index),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(AddExpenseScreen()),
      ),
    );
  }
}
