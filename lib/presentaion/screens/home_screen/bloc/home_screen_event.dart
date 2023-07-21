part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.expenseDeleted({
    required String id,
  }) = _ExpenseDeleted;
  const factory HomeScreenEvent.expenseSaved({
    required Expense expense,
  }) = _ExpenseSaved;
  const factory HomeScreenEvent.getAllExpensesRequested() = _GetAllExpensesRequested;
  const factory HomeScreenEvent.expenseRemovedFromList({
    required String id,
  }) = _ExpenseRemovedFromList;
  const factory HomeScreenEvent.expenseAddedToList({
    required Expense expense,
  }) = _ExpenseAddedToList;
}
