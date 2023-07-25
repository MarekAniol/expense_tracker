part of 'chart_bloc.dart';

@freezed
class ChartEvent with _$ChartEvent {
  const factory ChartEvent.expenseBucketsCreated({
    required List<Expense> expenses,
  }) = _ExpenseBucketsCreated;
}
