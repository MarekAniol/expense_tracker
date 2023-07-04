import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/models/expense.dart';

class ExpenseService {
  ExpenseService({
    required ExpenseDataSource expenseDataSource,
  }) : _expenseDataSource = expenseDataSource;

  final ExpenseDataSource _expenseDataSource;

  Future<void> deleteExpense(int id) async {
    await _expenseDataSource.deleteExpense(id);
  }

  Future<Expense> createExpense(Expense expense) async {
    return await _expenseDataSource.createExpense(expense);
  }
}
