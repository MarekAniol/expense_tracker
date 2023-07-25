import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/locale/data/hive_local_data.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';

class ExpenseDataSourceImpl extends ExpenseDataSource {
  ExpenseDataSourceImpl({
    required HiveLocalData hiveLocalData,
  }) : _hiveLocalData = hiveLocalData;
  final HiveLocalData _hiveLocalData;

  @override
  Future<Expense> saveExpense(Expense expense) async {
    final localModel = expense.toLocalModel();
    await _hiveLocalData.expenseBox.put(
      localModel.id,
      localModel,
    );
    final retrivedModel = _hiveLocalData.expenseBox.get(localModel.id) ?? localModel;
    return retrivedModel.toDomainModel();
  }

  @override
  Future<void> deleteExpense(String id) async {
    await _hiveLocalData.expenseBox.delete(id);
  }

  @override
  Future<List<Expense>> getAllExpenses() async {
    List<Expense> expenses = _hiveLocalData.expenseBox.values
        .map(
          (expense) => expense.toDomainModel(),
        )
        .toList();
    return expenses;
  }
}
