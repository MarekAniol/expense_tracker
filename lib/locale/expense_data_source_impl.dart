import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:hive/hive.dart';

class ExpenseDataSourceImpl extends ExpenseDataSource {
  ExpenseDataSourceImpl({
    required this.expenseBox,
  });

  final Box<ExpenseLocalModel> expenseBox;

  @override
  Future<Expense> createExpense(Expense expense) async {
    final localModel = expense.toLocalModel();
    await expenseBox.put(
      localModel.id,
      localModel,
    );
    return localModel.toDomainModel();
  }

  @override
  Future<void> deleteExpense(int id) async {
    await expenseBox.delete(id);
  }
}
