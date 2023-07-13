import 'package:expense_tracker/presentaion/screens/home_screen/widgets/expenses_list.dart';
import 'package:expense_tracker/presentaion/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ExpensesList(),
          ),
        ],
      ),
    );
  }
}
