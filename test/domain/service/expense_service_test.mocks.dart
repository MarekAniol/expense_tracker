// Mocks generated by Mockito 5.4.2 from annotations
// in expense_tracker/test/domain/service/expense_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:expense_tracker/domain/data/expense_data_source.dart' as _i3;
import 'package:expense_tracker/domain/models/expense.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeExpense_0 extends _i1.SmartFake implements _i2.Expense {
  _FakeExpense_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ExpenseDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExpenseDataSource extends _i1.Mock implements _i3.ExpenseDataSource {
  @override
  _i4.Future<_i2.Expense> createExpense(_i2.Expense? expense) =>
      (super.noSuchMethod(
        Invocation.method(
          #createExpense,
          [expense],
        ),
        returnValue: _i4.Future<_i2.Expense>.value(_FakeExpense_0(
          this,
          Invocation.method(
            #createExpense,
            [expense],
          ),
        )),
        returnValueForMissingStub: _i4.Future<_i2.Expense>.value(_FakeExpense_0(
          this,
          Invocation.method(
            #createExpense,
            [expense],
          ),
        )),
      ) as _i4.Future<_i2.Expense>);
  @override
  _i4.Future<void> deleteExpense(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteExpense,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
