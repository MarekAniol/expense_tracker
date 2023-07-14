import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewExpenseModal extends StatefulWidget {
  const NewExpenseModal({super.key});

  @override
  State<NewExpenseModal> createState() => _NewExpenseModalState();
}

class _NewExpenseModalState extends State<NewExpenseModal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            onChanged: (value) {},
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<CreateNewExpenseBloc, CreateNewExpenseState>(
                  buildWhen: (previous, current) => previous.selectedDate != current.selectedDate,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(state.selectedDate?.formattedDate ?? 'No date picked'),
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () => context.setDate(
                              lastChosenDate: state.selectedDate,
                            ),
                            icon: const Icon(Icons.calendar_month),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Builder(builder: (context) {
                return BlocBuilder<CreateNewExpenseBloc, CreateNewExpenseState>(
                  buildWhen: (previous, current) =>
                      previous.selectedCategory != current.selectedCategory,
                  builder: (context, state) {
                    return DropdownButton(
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
              }),
              const Spacer(),
              TextButton(
                onPressed: context.closeModal,
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: implement save expense
                },
                child: const Text('Save'),
              )
            ],
          )
        ],
      ),
    );
  }
}
