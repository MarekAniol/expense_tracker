import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveModalButton extends StatelessWidget {
  const SaveModalButton({
    required this.modalContext,
    required this.homeContext,
    super.key,
  });

  final BuildContext modalContext;
  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewExpenseBloc, CreateNewExpenseState>(
      listenWhen: (_, current) => current.isValidated == true,
      listener: (context, state) {
        modalContext.closeModal();
        homeContext.read<HomeScreenBloc>().add(
              HomeScreenEvent.expenseSaved(
                expense: state.expense,
              ),
            );
        context.read<CreateNewExpenseBloc>().add(
              const CreateNewExpenseEvent.stateExpenseReset(),
            );
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<CreateNewExpenseBloc>().add(
                  const CreateNewExpenseEvent.allExpenseDataCreated(),
                );
          },
          child: const Text('Save'),
        );
      },
    );
  }
}
