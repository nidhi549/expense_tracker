import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'bindings/expense_binding.dart';
import 'models/expense_model.dart'; // Import your Expense model
import 'views/home_screen.dart';
a
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive

  // Register the Expense model adapter
  Hive.registerAdapter(ExpenseAdapter());

  // Open the Hive box for expenses
  await Hive.openBox<Expense>('expenses');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker',
      initialBinding: ExpenseBinding(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
