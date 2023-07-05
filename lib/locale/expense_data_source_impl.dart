import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/locale/hive_service.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';

class ExpenseDataSourceImpl extends ExpenseDataSource {
  ExpenseDataSourceImpl({
    required HiveService hiveService,
  }) : _hiveService = hiveService;
  final HiveService _hiveService;

  @override
  Future<Expense> createExpense(Expense expense) async {
    final localModel = expense.toLocalModel();
    await _hiveService.expenseBox.put(
      localModel.id,
      localModel,
    );
    final retrivedModel = _hiveService.expenseBox.get(localModel.id) ?? localModel;
    return retrivedModel.toDomainModel();
  }

  @override
  Future<void> deleteExpense(int id) async {
    await _hiveService.expenseBox.delete(id);
  }
}
