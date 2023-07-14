part of 'create_new_expense_bloc.dart';

@freezed
class CreateNewExpenseEvent with _$CreateNewExpenseEvent {
  const factory CreateNewExpenseEvent.expenseCreated({
    required String id,
    required String title,
    required double amount,
    required DateTime date,
    required Category category,
  }) = _ExpenseCreated;
}
