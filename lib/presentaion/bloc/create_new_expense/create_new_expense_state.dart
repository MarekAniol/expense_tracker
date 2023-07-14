part of 'create_new_expense_bloc.dart';

@freezed
class CreateNewExpenseState with _$CreateNewExpenseState {
  const factory CreateNewExpenseState({
    required Expense expense,
    required DateTime? selectedDate,
    required CategoryIcon? selectedCategory,
  }) = _CreateNewExpenseState;

  factory CreateNewExpenseState.initial() => CreateNewExpenseState(
        expense: Expense.initial(),
        selectedDate: null,
        selectedCategory: null,
      );
}
