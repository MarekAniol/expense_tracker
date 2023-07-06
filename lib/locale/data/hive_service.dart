import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:hive/hive.dart';

abstract class HiveService {
  Future<void> initHive();
  Box<ExpenseLocalModel> get expenseBox;
}
