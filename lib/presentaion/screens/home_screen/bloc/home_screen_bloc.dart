import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/domain/service/expense_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_bloc.freezed.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc({required ExpenseService expenseService})
      : _expenseService = expenseService,
        super(HomeScreenState.initial()) {
    on<HomeScreenEvent>(handlerEvent, transformer: sequential());
  }

  final ExpenseService _expenseService;

  Future<void> handlerEvent(
    HomeScreenEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    await event.map(
      expenseDeleted: (value) => _expenseDeleted(value, emit),
      expenseSaved: (value) => _expenseSaved(value, emit),
      getAllExpensesRequested: (value) => _getAllExpenses(value, emit),
    );
  }

  Future<void> _getAllExpenses(
    _GetAllExpensesRequested event,
    Emitter<HomeScreenState> emit,
  ) async {
    final expenses = await _expenseService.getAllExpenses();
    emit(
      state.copyWith(
        expenses: expenses,
      ),
    );
  }

  Future<void> _expenseDeleted(
    _ExpenseDeleted event,
    Emitter<HomeScreenState> emit,
  ) async {
    await _expenseService.deleteExpense(event.id);
    add(const HomeScreenEvent.getAllExpensesRequested());
  }

  Future<void> _expenseSaved(
    _ExpenseSaved event,
    Emitter<HomeScreenState> emit,
  ) async {
    await _expenseService.saveExpense(event.expense);
    add(const HomeScreenEvent.getAllExpensesRequested());
  }
}
