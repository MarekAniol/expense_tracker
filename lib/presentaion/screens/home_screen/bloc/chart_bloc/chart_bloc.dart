import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/domain/models/expense_bucket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_bloc.freezed.dart';
part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartState.initial()) {
    on<ChartEvent>(handlerEvent, transformer: sequential());
  }

  Future<void> handlerEvent(
    ChartEvent event,
    Emitter<ChartState> emit,
  ) async {
    await event.map(
      expenseBucketsCreated: (value) => _expenseBucketsCreated(value, emit),
    );
  }

  Future<void> _expenseBucketsCreated(
    _ExpenseBucketsCreated event,
    Emitter<ChartState> emit,
  ) async {
    final expenseBuckets = Category.values
        .map(
          (category) => ExpenseBucket.forCategory(
            event.expenses,
            category,
          ),
        )
        .where((bucket) => bucket.expenses.isNotEmpty)
        .toList();
    emit(
      state.copyWith(
        expenseBuckets: expenseBuckets,
      ),
    );

    emit(
      state.copyWith(
        expenseBuckets: expenseBuckets,
      ),
    );
  }
}
