import 'package:expense_tracker/presentaion/extensions/category_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/context_extensions.dart';
import 'package:expense_tracker/presentaion/extensions/theme_extensions.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/chart_bloc/chart_bloc.dart';
import 'package:expense_tracker/presentaion/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            context.colorScheme.surface,
            context.colorScheme.surface.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: BlocBuilder<ChartBloc, ChartState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: state.expenseBuckets
                      .map(
                        (bucket) => ChartBar(
                          fill: state.fill(bucket),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: state.expenseBuckets
                    .map(
                      (bucket) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: bucket.category?.getIcon(
                            context.palette.primaryColorDark,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          );
        },
      ),
    );
  }
}
