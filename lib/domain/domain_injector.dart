import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/service/expense_service.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

extension DomainInjection on GetIt {
  Future<void> registerDomain() async {
    registerSingleton<Uuid>(const Uuid());
    registerFactory<ExpenseService>(
      () => ExpenseService(
        expenseDataSource: get<ExpenseDataSource>(),
      ),
    );
  }
}
