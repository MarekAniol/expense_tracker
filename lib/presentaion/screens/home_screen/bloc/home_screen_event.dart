part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.expenseDeleted({
    required int id,
  }) = _ExpenseDeleted;
  const factory HomeScreenEvent.expenseSaved({
    required Expense expense,
  }) = _ExpenseSaved;
  const factory HomeScreenEvent.getAllExpensesRequested() = _GetAllExpensesRequested;
}
