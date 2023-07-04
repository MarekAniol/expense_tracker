import 'package:expense_tracker/domain/models/expense.dart';

abstract class ExpenseDataSource {
  Future<Expense> createExpense(Expense expense);
  Future<void> deleteExpense(int id);
}
