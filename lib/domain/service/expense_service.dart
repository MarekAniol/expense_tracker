import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/models/expense.dart';

class ExpenseService {
  ExpenseService({
    required ExpenseDataSource expenseDataSource,
  }) : _expenseDataSource = expenseDataSource;

  final ExpenseDataSource _expenseDataSource;

  Future<void> deleteExpense(String id) async {
    await _expenseDataSource.deleteExpense(id);
  }

  Future<void> saveExpense(Expense expense) async {
    return await _expenseDataSource.saveExpense(expense);
  }

  Future<List<Expense>> getAllExpenses() async {
    return await _expenseDataSource.getAllExpenses();
  }
}
