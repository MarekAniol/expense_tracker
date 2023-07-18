import 'package:expense_tracker/domain/models/expense.dart';
import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/date_extensions.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    required this.expense,
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<HomeScreenBloc>().add(
            HomeScreenEvent.expenseDeleted(
              id: expense.id,
            ),
          ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            children: [
              Text(expense.title),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      expense.category.getIcon,
                      const SizedBox(width: 8),
                      Text(expense.date.formattedDate),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
