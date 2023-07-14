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
  const factory CreateNewExpenseEvent.datePicked({
    required DateTime date,
  }) = _DatePicked;
  const factory CreateNewExpenseEvent.categorySelected({
    required CategoryIcon? category,
  }) = _CategorySelected;
}
