import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/locale/expense_data_source_impl.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

extension LocaleInjection on GetIt {
  Future<void> registerLocale() async {
    this
      .._registerHive()
      ..registerFactory<ExpenseDataSource>(
        () => ExpenseDataSourceImpl(
          expenseBox: get<Box<ExpenseLocalModel>>(),
        ),
      );
  }

  Future<void> _registerHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(
      ExpenseLocalModelAdapter(),
    );
    final expenseBox = await Hive.openBox<ExpenseLocalModel>(
      'expenseBox',
    );
    registerLazySingleton<Box<ExpenseLocalModel>>(
      () => expenseBox,
    );
  }
}
