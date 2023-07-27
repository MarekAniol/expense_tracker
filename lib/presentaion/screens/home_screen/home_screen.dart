import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/chart_bloc/chart_bloc.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/widgets/expenses_list.dart';
import 'package:expense_tracker/presentaion/widgets/chart/chart.dart';
import 'package:expense_tracker/presentaion/widgets/custom_app_bar.dart';
import 'package:expense_tracker/presentaion/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocListener<HomeScreenBloc, HomeScreenState>(
        listenWhen: (previous, current) => previous.expenses != current.expenses,
        listener: (context, state) {
          context.read<ChartBloc>().add(
                ChartEvent.expenseBucketsCreated(
                  expenses: state.expenses,
                ),
              );
        },
        child: SnackBarMessage(
          child: BlocBuilder<ChartBloc, ChartState>(
            buildWhen: (previous, current) => previous.expenseBuckets != current.expenseBuckets,
            builder: (context, state) {
              return const _ContentPageOrientation();
            },
          ),
        ),
      ),
    );
  }
}

class _ContentPageOrientation extends StatelessWidget {
  const _ContentPageOrientation();

  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait
        ? const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Chart(),
              Expanded(child: ExpensesList()),
            ],
          )
        : const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: Chart()),
              Expanded(child: ExpensesList()),
            ],
          );
  }
}
