import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SnackBarMessage extends StatelessWidget {
  const SnackBarMessage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeScreenBloc, HomeScreenState>(
      listenWhen: (previous, current) =>
          previous.isExpenseDeleted != current.isExpenseDeleted &&
          current.lastDeletedExpenseIndex != null,
      listener: (context, state) {
        context.showCustomSnackBar(
            onUndoPressed: () => context.read<HomeScreenBloc>().add(
                  HomeScreenEvent.expenseSaved(
                    expense: state.lastDeletedExpense,
                  ),
                ));
      },
      child: child,
    );
  }
}
