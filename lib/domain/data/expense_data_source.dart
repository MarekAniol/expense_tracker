import 'package:expense_tracker/domain/models/expense.dart';

abstract class ExpenseDataSource {
  Future<void> saveExpense(Expense expense);
  Future<List<Expense>> getAllExpenses();
  Future<void> deleteExpense(int id);
}
