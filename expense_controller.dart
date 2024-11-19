ximport 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/expense_model.dart';

class ExpenseController extends GetxController {
  final expenses = <Expense>[].obs;
  final totalExpense = 0.0.obs;

  final Box expenseBox = Hive.box('expenses');

  @override
  void onInit() {
    loadExpenses();
    super.onInit();
  }

  void addExpense(String category, double amount) {
    final expense = Expense(category: category, amount: amount, date: DateTime.now());
    expenses.add(expense);
    expenseBox.add(expense);
    calculateTotalExpense();
  }

  void deleteExpense(int index) {
    expenses.removeAt(index);
    expenseBox.deleteAt(index);
    calculateTotalExpense();
  }

  void loadExpenses() {
    final storedExpenses
