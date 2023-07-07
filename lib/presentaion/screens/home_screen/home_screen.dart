import 'package:expense_tracker/presentaion/screens/home_screen/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Home Screen"),
        Expanded(
          child: ExpensesList(),
        ),
      ],
    );
  }
}
