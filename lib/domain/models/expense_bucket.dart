import 'package:expense_tracker/domain/models/expense.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_bucket.freezed.dart';

@freezed
class ExpenseBucket with _$ExpenseBucket {
  factory ExpenseBucket({
    required List<Expense> expenses,
    required Category? category,
  }) = _ExpenseBucket;

  ExpenseBucket._();

  factory ExpenseBucket.initial() => ExpenseBucket(
        expenses: [],
        category: null,
      );
  factory ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    category,
  ) {
    final expenses = allExpenses
        .where(
          (element) => element.category == category,
        )
        .toList();
    return ExpenseBucket(
      expenses: expenses,
      category: category,
    );
  }
  double get totalAmount => expenses.fold(
        0.0,
        (previousValue, element) => previousValue + element.amount,
      );
}
