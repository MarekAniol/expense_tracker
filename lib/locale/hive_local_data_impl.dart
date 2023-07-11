import 'dart:io';

import 'package:expense_tracker/locale/data/hive_local_data.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:hive/hive.dart';

class HiveLocalDataImpl implements HiveLocalData {
  HiveLocalDataImpl({
    required HiveInterface hive,
    required Directory documentsDirectory,
  })  : _hive = hive,
        _documentsDirectory = documentsDirectory;

  final HiveInterface _hive;
  final Directory _documentsDirectory;
  late Box<ExpenseLocalModel> _expenseBox;

  @override
  Future<void> initHive() async {
    _hive.init(_documentsDirectory.path);
    _hive.registerAdapter(ExpenseLocalModelAdapter());

    try {
      _expenseBox = await _hive.openBox<ExpenseLocalModel>('expenseBox');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Box<ExpenseLocalModel> get expenseBox => _expenseBox;
}
