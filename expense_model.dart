import 'package:hive/hive.dart';

part 'expense_model.g.dart';  // Generated file for Hive's type adapter

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  final String category;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  Expense({required this.category, required this.amount, required this.date});
}
