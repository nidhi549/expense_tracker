import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';

class SummaryScreen extends StatelessWidget {
  final ExpenseController controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Summary'),
      ),
      body: Obx(() {
        // Filter expenses for the current month
        DateTime now = DateTime.now();
        List filteredExpenses = controller.expenses
            .where((expense) =>
                expense.date.year == now.year && expense.date.month == now.month)
            .toList();

        // Calculate total for the current month
        double totalMonthExpense = filteredExpenses.fold(
            0.0, (sum, item) => sum + item.amount);

        // Group by categories
        Map<String, double> categorySummary = {};
        for (var expense in filteredExpenses) {
          if (categorySummary.containsKey(expense.category)) {
            categorySummary[expense.category] =
                categorySummary[expense.category]! + expense.amount;
          } else {
            categorySummary[expense.category] = expense.amount;
          }
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Expenses: \$${totalMonthExpense.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Expenses by Category:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: categorySummary.length,
                  itemBuilder: (context, index) {
                    String category = categorySummary.keys.elementAt(index);
                    double amount = categorySummary[category]!;
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(category),
                        trailing: Text('\$${amount.toStringAsFixed(2)}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
