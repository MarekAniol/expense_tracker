import 'dart:io';

import 'package:expense_tracker/locale/data/hive_local_date.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:hive/hive.dart';

class HiveLocalDataImpl implements HiveLocalData {
  HiveLocalDataImpl({
    required HiveInterface hive,
    required Directory documentsDirectory,
    required Box<ExpenseLocalModel> expenseBox,
  })  : _hive = hive,
        _documentsDirectory = documentsDirectory,
        _expenseBox = expenseBox;
  final HiveInterface _hive;
  final Directory _documentsDirectory;
  final Box<ExpenseLocalModel> _expenseBox;

  @override
  Future<void> initHive() async {
    _hive.init(_documentsDirectory.path);
    _hive.registerAdapter(ExpenseLocalModelAdapter());
  }

  @override
  Box<ExpenseLocalModel> get expenseBox {
    return _expenseBox;
  }
}
