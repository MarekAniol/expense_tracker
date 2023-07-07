import 'dart:io';

import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/locale/data/hive_local_data.dart';
import 'package:expense_tracker/locale/expense_data_source_impl.dart';
import 'package:expense_tracker/locale/hive_local_data_impl.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

extension LocaleInjection on GetIt {
  void registerLocale() {
    _registerHive();
    registerFactory<ExpenseDataSource>(
      () => ExpenseDataSourceImpl(
        hiveLocalData: get<HiveLocalData>(),
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
      ..registerSingletonAsync<HiveLocalData>(() async {
        await allReady();
        final hiveLocalData = HiveLocalDataImpl(
          hive: get<HiveInterface>(),
          documentsDirectory: get<Directory>(),
          expenseBox: get<Box<ExpenseLocalModel>>(),
        );
        await hiveLocalData.initHive();
        return hiveLocalData;
      });
  }
}
