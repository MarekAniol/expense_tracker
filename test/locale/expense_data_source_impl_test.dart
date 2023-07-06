import 'dart:io';

import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/locale/expense_data_source_impl.dart';
import 'package:expense_tracker/locale/hive_service.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as path;

@GenerateNiceMocks([
  MockSpec<Box>(),
  MockSpec<HiveService>(),
])
import 'expense_data_source_impl_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockHiveService mockHiveService;
  late MockBox<ExpenseLocalModel> mockBox;
  late ExpenseDataSourceImpl expenseDataSourceImpl;

  setUp(
    () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'), (MethodCall methodCall) async {
        if (methodCall.method == 'getApplicationDocumentsDirectory') {
          return path.join(Directory.systemTemp.path, 'test_documents');
        }
        return null;
      });
      mockHiveService = MockHiveService();
      mockBox = MockBox<ExpenseLocalModel>();
      when(mockHiveService.expenseBox).thenReturn(mockBox);
      expenseDataSourceImpl = ExpenseDataSourceImpl(
        hiveService: mockHiveService,
      );
    },
  );

  test('should call put on the box when creating an expense', () async {
    final expense = Expense(
      id: '1',
      title: 'Coffee',
      amount: 3.5,
      date: DateTime.now(),
      category: Category.food,
    );

    when(mockBox.put(any, any)).thenAnswer((Invocation invocation) async {
      return Future.value();
    });

    final result = await expenseDataSourceImpl.saveExpense(expense);
    expect(result, equals(expense));
    verify(mockBox.put(any, any)).called(1);
  });

  test('should call delete on the box when deleting an expense', () async {
    const id = 1;

    when(mockBox.delete(any)).thenAnswer((_) async => Future.value());

    await expenseDataSourceImpl.deleteExpense(id);

    verify(mockBox.delete(id)).called(1);
  });
}
