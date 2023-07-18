import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:expense_tracker/presentaion/injector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

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
      allExpenseDataCreated: (value) => _allExpenseDataCreated(value, emit),
      datePicked: (value) => _datePicked(value, emit),
      categorySelected: (value) => _categorySelected(value, emit),
      amountAdded: (value) => _amountAdded(value, emit),
      titleAdded: (value) => _titleAdded(value, emit),
      stateExpenseReset: (value) => _stateExpenseReset(value, emit),
    );
  }

  Future<void> _allExpenseDataCreated(
    _AllExpenseDataCreated event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    final amountIsInvalid = state.amount == null || state.amount! <= 0;
    if (state.title == null ||
        state.selectedCategory == null ||
        state.selectedDate == null ||
        amountIsInvalid) {
      emit(
        state.copyWith(
          isValidated: false,
        ),
      );
      emit(
        state.copyWith(
          isValidated: null,
        ),
      );
    } else {
      final expenseId = injector<Uuid>().v4();
      emit(
        state.copyWith(
          isValidated: true,
          expense: state.expense.copyWith(
            id: expenseId,
            title: state.title!,
            category: state.selectedCategory!.toCategory,
            date: state.selectedDate!,
            amount: state.amount!,
          ),
        ),
      );
      log('${state.expense}');
    }
  }

  Future<void> _datePicked(
    _DatePicked event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDate: event.date,
      ),
    );
  }

  Future<void> _categorySelected(
    _CategorySelected event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedCategory: event.category,
      ),
    );
  }

  Future<void> _amountAdded(
    _AmountAdded event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    if (event.amount.contains(',')) {
      final amount = double.tryParse(
        event.amount.replaceAll(',', '.'),
      );
      emit(
        state.copyWith(
          amount: amount,
        ),
      );
    } else {
      final amount = double.tryParse(event.amount);
      emit(
        state.copyWith(
          amount: amount,
        ),
      );
    }
  }

  Future<void> _titleAdded(
    _TitleAdded event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  Future<void> _stateExpenseReset(
    _StateExpenseReset event,
    Emitter<CreateNewExpenseState> emit,
  ) async {
    emit(
      state.copyWith(
        expense: Expense.initial(),
        selectedDate: null,
        amount: null,
        title: null,
        selectedCategory: null,
        isValidated: null,
      ),
    );
  }
}
