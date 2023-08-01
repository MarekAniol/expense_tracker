import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<CreateNewExpenseBloc, CreateNewExpenseState>(
          buildWhen: (previous, current) => previous.selectedCategory != current.selectedCategory,
          builder: (context, state) {
            return DropdownButton(
              underline: Container(
                height: 1,
                color: Theme.of(context).hintColor,
              ),
              isExpanded: true,
              value: state.selectedCategory,
              items: CategoryIcon.values.getCategories
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Row(
                        children: [
                          category.icon,
                          const SizedBox(width: 8),
                          Text(
                            category.name,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                context.read<CreateNewExpenseBloc>().add(
                      CreateNewExpenseEvent.categorySelected(
                        category: value,
                      ),
                    );
              },
            );
          },
        );
      },
    );
  }
}
