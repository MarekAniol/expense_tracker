import 'package:expense_tracker/domain/models/expense.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should create a valid expense model', () {
    final expense = Expense(
      id: '1',
      title: 'Coffee',
      amount: 3.5,
      date: DateTime.now(),
      category: Category.food,
    );

    expect(expense.id, '1');
    expect(expense.title, 'Coffee');
    expect(expense.amount, 3.5);
    expect(expense.category, Category.food);
  });
}
