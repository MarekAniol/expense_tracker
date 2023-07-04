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
}

enum Category {
  food,
  transport,
  shopping,
  health,
  entertainment,
  others,
}
