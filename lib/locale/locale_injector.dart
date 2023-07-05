import 'dart:io';

import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/locale/expense_data_source_impl.dart';
import 'package:expense_tracker/locale/hive_service.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

extension LocaleInjection on GetIt {
  void registerLocale() {
    _registerHive();
    registerFactory<ExpenseDataSource>(
      () => ExpenseDataSourceImpl(
        hiveService: get<HiveService>(),
      ),
    );
  }

  Future<void> _registerHive() async {
    this
      ..registerSingleton<HiveInterface>(Hive)
      ..registerSingleton<Directory>(
        await getApplicationDocumentsDirectory(),
      )
      ..registerSingletonAsync<Box<ExpenseLocalModel>>(() async {
        await allReady();
        final box = await Hive.openBox<ExpenseLocalModel>('expenseBox');
        return box;
      })
      ..registerSingletonAsync<HiveService>(() async {
        await allReady();
        final hiveService = HiveService(
          hive: get<HiveInterface>(),
          documentsDirectory: get<Directory>(),
          expenseBox: get<Box<ExpenseLocalModel>>(),
        );
        await hiveService.initHive();
        return hiveService;
      });
  }
}
