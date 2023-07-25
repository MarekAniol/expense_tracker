part of 'create_new_expense_bloc.dart';

@freezed
class CreateNewExpenseState with _$CreateNewExpenseState {
  const factory CreateNewExpenseState({
    required Expense expense,
    required DateTime? selectedDate,
    required double? amount,
    required String? title,
    required CategoryIcon? selectedCategory,
    required bool? isValidated,
  }) = _CreateNewExpenseState;

  factory CreateNewExpenseState.initial() => CreateNewExpenseState(
        expense: Expense.initial(),
        selectedDate: null,
        amount: null,
        title: null,
        selectedCategory: null,
        isValidated: null,
      );
}
