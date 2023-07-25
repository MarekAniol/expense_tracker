import 'dart:async';
import 'dart:io';

import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/locale/data/hive_local_data.dart';
import 'package:expense_tracker/locale/expense_data_source_impl.dart';
import 'package:expense_tracker/locale/hive_local_data_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

extension LocaleInjection on GetIt {
  Future<void> registerLocale() async {
    await _registerHive();
    await allReady();
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
      );

    registerSingletonAsync<HiveLocalData>(
      () async {
        final hiveLocalData = HiveLocalDataImpl(
          hive: get<HiveInterface>(),
          documentsDirectory: get<Directory>(),
        );
        await hiveLocalData.initHive();
        return hiveLocalData;
      },
    );
  }
}
