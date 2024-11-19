// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 0;

  @override
  Expense read(BinaryReader reader) {
    final category = reader.readString();
    final amount = reader.readDouble();
    final dateMillis = reader.readInt();  // Read the timestamp (milliseconds)
    final date = DateTime.fromMillisecondsSinceEpoch(dateMillis);  // Convert to DateTime
    return Expense(category: category, amount: amount, date: date);
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer.writeString(obj.category);
    writer.writeDouble(obj.amount);
    writer.writeInt(obj.date.millisecondsSinceEpoch);  // Write the timestamp (milliseconds)
  }
}
