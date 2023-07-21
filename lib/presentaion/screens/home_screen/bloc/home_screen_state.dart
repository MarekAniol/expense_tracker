part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required List<Expense> expenses,
    required Expense lastDeletedExpense,
    required int? lastDeletedExpenseIndex,
    required bool isExpenseDeleted,
  }) = _HomeScreenState;

  const HomeScreenState._();

  factory HomeScreenState.initial() => HomeScreenState(
        expenses: [],
        lastDeletedExpense: Expense.initial(),
        lastDeletedExpenseIndex: null,
        isExpenseDeleted: false,
      );

  String getId(int index) => expenses[index].id;
  int get deletedExpenseIndex => lastDeletedExpenseIndex ?? 0;
  Expense get deletedExpense => lastDeletedExpense;
}
