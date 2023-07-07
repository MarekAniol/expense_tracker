import 'package:expense_tracker/domain/data/expense_data_source.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/domain/service/expense_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ExpenseDataSource>()])
import 'expense_service_test.mocks.dart';

void main() {
  late MockExpenseDataSource mockExpenseDataSource;
  late ExpenseService expenseService;

  setUp(() {
    mockExpenseDataSource = MockExpenseDataSource();
    expenseService = ExpenseService(expenseDataSource: mockExpenseDataSource);
  });

  test('should call saveExpense on the ExpenseDataSource', () async {
    final expense = Expense(
      id: '1',
      title: 'Coffee',
      amount: 3.5,
      date: DateTime.now(),
      category: Category.food,
    );

    when(mockExpenseDataSource.saveExpense(any)).thenAnswer((_) async => expense);
    await expenseService.saveExpense(expense);
    verify(mockExpenseDataSource.saveExpense(expense)).called(1);
  });

  test('should call deleteExpense on the ExpenseDataSource', () async {
    const id = 1;

    when(mockExpenseDataSource.deleteExpense(any)).thenAnswer((_) async => Future.value());
    await expenseService.deleteExpense(id);
    verify(mockExpenseDataSource.deleteExpense(id)).called(1);
  });

  test('should call getAllExpenses on the ExpenseDataSource and return List of Expenses', () async {
    final expenses = [
      Expense(
        id: '1',
        title: 'Coffee',
        amount: 3.5,
        date: DateTime.now(),
        category: Category.food,
      ),
      Expense(
        id: '2',
        title: 'Tea',
        amount: 3,
        date: DateTime.now(),
        category: Category.food,
      )
    ];

    when(mockExpenseDataSource.getAllExpenses()).thenAnswer((_) async => expenses);
    final result = await expenseService.getAllExpenses();
    verify(mockExpenseDataSource.getAllExpenses()).called(1);
    expect(result, equals(expenses));
  });
}
