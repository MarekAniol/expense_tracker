import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/paddings_extensions.dart';
import 'package:expense_tracker/presentaion/widgets/expense_modal/amount_field.dart';
import 'package:expense_tracker/presentaion/widgets/expense_modal/cancel_button.dart';
import 'package:expense_tracker/presentaion/widgets/expense_modal/category_picker.dart';
import 'package:expense_tracker/presentaion/widgets/expense_modal/date_picker.dart';
import 'package:expense_tracker/presentaion/widgets/expense_modal/save_modal_button.dart';
import 'package:expense_tracker/presentaion/widgets/expense_modal/title_text_field.dart';
import 'package:flutter/material.dart';

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
        padding: context.modalPadding,
        child: context.isPortrait
            ? _VerticalOrientationModal(
                modalContext: widget.modalContext,
                homeContext: widget.homeContext,
                controller: _controllerAmount,
              )
            : _HorizontalOrientationModal(
                modalContext: widget.modalContext,
                homeContext: widget.homeContext,
                controller: _controllerAmount,
              ),
      ),
    );
  }
}

class _VerticalOrientationModal extends StatelessWidget {
  const _VerticalOrientationModal({
    required this.modalContext,
    required this.homeContext,
    required this.controller,
  });

  final BuildContext modalContext;
  final BuildContext homeContext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleTextField(),
        Row(
          children: [
            Expanded(
              child: AmountField(
                controller: controller,
              ),
            ),
            const Expanded(
              child: DatePicker(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(
              flex: 3,
              child: CategoryPicker(),
            ),
            const Spacer(),
            CancelButton(
              parrentContext: modalContext,
            ),
            SaveModalButton(
              modalContext: modalContext,
              homeContext: homeContext,
            ),
          ],
        )
      ],
    );
  }
}

class _HorizontalOrientationModal extends StatelessWidget {
  const _HorizontalOrientationModal({
    required this.modalContext,
    required this.homeContext,
    required this.controller,
  });

  final BuildContext modalContext;
  final BuildContext homeContext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: TitleTextField(),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: AmountField(
                controller: controller,
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Expanded(
              child: CategoryPicker(),
            ),
            Expanded(
              child: DatePicker(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Spacer(),
            CancelButton(
              parrentContext: modalContext,
            ),
            SaveModalButton(
              modalContext: modalContext,
              homeContext: homeContext,
            ),
          ],
        )
      ],
    );
  }
}
