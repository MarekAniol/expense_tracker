part of 'chart_bloc.dart';

@freezed
class ChartState with _$ChartState {
  factory ChartState({
    required List<ExpenseBucket> expenseBuckets,
  }) = _ChartState;

  ChartState._();

  factory ChartState.initial() => ChartState(
        expenseBuckets: [],
      );

  double get maxTotalExpense {
    double maxTotalAmount = 0;

    for (final bucket in expenseBuckets) {
      if (bucket.totalAmount > maxTotalAmount) {
        maxTotalAmount = bucket.totalAmount;
      }
    }
    return maxTotalAmount;
  }

  double fill(ExpenseBucket bucket) {
    return bucket.totalAmount == 0 ? 0 : bucket.totalAmount / maxTotalExpense;
  }
}
