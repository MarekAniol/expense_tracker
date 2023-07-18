import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/date_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/text_controller_extension.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewExpenseModal extends StatefulWidget {
  const NewExpenseModal({
    required this.homeContext,
    required this.modalContext,
    super.key,
  });

  final BuildContext homeContext;
  final BuildContext modalContext;

  @override
  State<NewExpenseModal> createState() => _NewExpenseModalState();
}

class _NewExpenseModalState extends State<NewExpenseModal> {
  late final TextEditingController _controllerAmount;

  @override
  void initState() {
    super.initState();
    _controllerAmount = TextEditingController();
  }

  @override
  void dispose() {
    _controllerAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                context.read<CreateNewExpenseBloc>().add(
                      CreateNewExpenseEvent.titleAdded(
                        title: value,
                      ),
                    );
              },
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controllerAmount,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?,?\d{0,2}'),
                      ),
                    ],
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: (value) {
                      _controllerAmount.handleInput(value);
                      context.read<CreateNewExpenseBloc>().add(
                            CreateNewExpenseEvent.amountAdded(
                              amount: _controllerAmount.text,
                            ),
                          );
                    },
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
                Builder(builder: (context) {
                  return TextButton(
                    onPressed: () => widget.modalContext.closeModal(),
                    child: const Text('Cancel'),
                  );
                }),
                BlocConsumer<CreateNewExpenseBloc, CreateNewExpenseState>(
                  listenWhen: (_, current) => current.isValidated == true,
                  listener: (context, state) {
                    widget.modalContext.closeModal();
                    widget.homeContext.read<HomeScreenBloc>().add(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
