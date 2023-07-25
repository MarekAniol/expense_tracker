part of 'create_new_expense_bloc.dart';

@freezed
class CreateNewExpenseEvent with _$CreateNewExpenseEvent {
  const factory CreateNewExpenseEvent.allExpenseDataCreated() = _AllExpenseDataCreated;
  const factory CreateNewExpenseEvent.datePicked({
    required DateTime date,
  }) = _DatePicked;
  const factory CreateNewExpenseEvent.categorySelected({
    required CategoryIcon? category,
  }) = _CategorySelected;
  const factory CreateNewExpenseEvent.titleAdded({
    required String title,
  }) = _TitleAdded;
  const factory CreateNewExpenseEvent.amountAdded({
    required String amount,
  }) = _AmountAdded;
  const factory CreateNewExpenseEvent.stateExpenseReset() = _StateExpenseReset;
}
