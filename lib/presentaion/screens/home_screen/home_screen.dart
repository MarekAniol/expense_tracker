import 'package:expense_tracker/presentaion/screens/home_screen/bloc/chart_bloc/chart_bloc.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/widgets/expenses_list.dart';
import 'package:expense_tracker/presentaion/widgets/chart/chart.dart';
import 'package:expense_tracker/presentaion/widgets/custom_app_bar.dart';
import 'package:expense_tracker/presentaion/widgets/snack_bar_message.dart';
import 'package:expense_tracker/presentaion/widgets/validate_dialog_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocListener<HomeScreenBloc, HomeScreenState>(
            listenWhen: (previous, current) =>
                (previous.expenses.isEmpty && previous.expenses != current.expenses) ||
                (current.expenses.isNotEmpty && previous.expenses != current.expenses),
            listener: (context, state) {
              context.read<ChartBloc>().add(
                    ChartEvent.expenseBucketsCreated(
                      expenses: state.expenses,
                    ),
                  );
            },
            child: BlocBuilder<ChartBloc, ChartState>(
              buildWhen: (previous, current) => current.expenseBuckets.isNotEmpty,
              builder: (context, state) {
                return const Chart();
              },
            ),
          ),
          const Expanded(
            child: SnackBarMessage(
              child: ValidateDialogMessage(
                child: ExpensesList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
