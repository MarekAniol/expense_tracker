import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/locale/models/expense_local_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should create a valid ExpenseLocalModel and convert it to Expense', () {
    final localModel = ExpenseLocalModel(
      id: '1',
      title: 'Coffee',
      amount: 3.5,
      date: DateTime.now(),
      category: Category.food.index,
    );

    final expense = localModel.toDomainModel();

    expect(expense.id, localModel.id);
    expect(expense.title, localModel.title);
    expect(expense.amount, localModel.amount);
    expect(expense.category, Category.values[localModel.category]);
  });
}
