import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String title,
    required double amount,
    required DateTime date,
    required Category category,
  }) = _Expense;

  factory Expense.initial() => Expense(
        id: "",
        title: "",
        amount: 0.0,
        date: DateTime.now(),
        category: Category.sport,
      );
}

enum Category {
  food,
  travels,
  shopping,
  health,
  entertainment,
  sport,
}
