import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/locale/expense_data_source_impl.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Box>()])
import 'expense_data_source_impl_test.mocks.dart';

void main() {
  late MockBox<ExpenseLocalModel> mockBox;
  late ExpenseDataSourceImpl expenseDataSourceImpl;

  setUp(
    () {
      mockBox = MockBox<ExpenseLocalModel>();
      expenseDataSourceImpl = ExpenseDataSourceImpl(
        expenseBox: mockBox,
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

    when(mockBox.put(any, any)).thenAnswer((_) async => Future.value());

    final result = await expenseDataSourceImpl.createExpense(expense);
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
