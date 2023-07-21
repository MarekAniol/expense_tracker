import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return state.expenses.isNotEmpty
            ? ListView.builder(
                itemCount: state.expenses.length,
                itemBuilder: (context, index) => Dismissible(
                  onDismissed: (_) {
                    context.read<HomeScreenBloc>().add(
                          HomeScreenEvent.expenseDeleted(
                            id: state.getId(index),
                          ),
                        );

                    // context.read<HomeScreenBloc>().add(
                    //       HomeScreenEvent.expenseRemovedFromList(
                    //         id: state.getId(index),
                    //       ),
                    //     );
                  },
                  key: ValueKey(state.getId(index)),
                  child: ExpenseItem(
                    expense: state.expenses[index],
                  ),
                ),
              )
            : const Center(
                child: Text(
                  'No expenses yet. Start adding some!',
                ),
              );
      },
    );
  }
}
