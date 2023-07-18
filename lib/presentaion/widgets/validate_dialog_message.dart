import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateDialogMessage extends StatelessWidget {
  const ValidateDialogMessage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewExpenseBloc, CreateNewExpenseState>(
      listenWhen: (_, current) => current.isValidated == false,
      listener: (context, _) {
        context.showCustomPopup();
      },
      child: child,
    );
  }
}
