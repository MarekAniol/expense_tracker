import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_new_expense_bloc.freezed.dart';
part 'create_new_expense_event.dart';
part 'create_new_expense_state.dart';

class CreateNewExpenseBloc extends Bloc<CreateNewExpenseEvent, CreateNewExpenseState> {
  CreateNewExpenseBloc() : super(CreateNewExpenseState.initial()) {
    on<CreateNewExpenseEvent>(handlerEvent, transformer: sequential());
  }

  Future<void> handlerEvent(
    CreateNewExpenseEvent event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    await event.map(
      expenseCreated: (value) => _expenseCreated(value, emit),
    );
  }

  Future<void> _expenseCreated(
    _ExpenseCreated event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    final expense = Expense(
      id: event.id,
      title: event.title,
      amount: event.amount,
      date: event.date,
      category: event.category,
    );
    emit(
      state.copyWith(
        expense: expense,
      ),
    );
  }
}
