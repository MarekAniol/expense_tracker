import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/service/expense_service.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

extension DomainInjection on GetIt {
  void registerDomain() {
    this
      ..registerSingleton<Uuid>(const Uuid())
      ..registerLazySingleton<ExpenseService>(
        () => ExpenseService(
          expenseDataSource: get<ExpenseDataSource>(),
        ),
      );
  }
}
