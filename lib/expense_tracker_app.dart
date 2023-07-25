import 'package:expense_tracker/presentaion/bloc/create_new_expense/create_new_expense_bloc.dart';
import 'package:expense_tracker/presentaion/injector.dart';
import 'package:expense_tracker/presentaion/route/expense_tracker_route.dart';
import 'package:expense_tracker/presentaion/theme/app_theme.dart';
import 'package:expense_tracker/presentaion/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseTrackerApp extends StatelessWidget {
  ExpenseTrackerApp({
    required this.appRouter,
    required this.appTheme,
    super.key,
  });
  final navigatorKey = GlobalKey<NavigatorState>();
  final ExpenseTrackerAppRouter appRouter;
  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<CreateNewExpenseBloc>(),
      child: MaterialApp(
        theme: appTheme.theme(LightPalette()),
        darkTheme: appTheme.theme(DarkPalette()),
        navigatorKey: navigatorKey,
        onGenerateRoute: appRouter.route,
        builder: (context, child) => _BaseScreen(
          navigatorKey: navigatorKey,
          child: child,
        ),
      ),
    );
  }
}

class _BaseScreen extends StatelessWidget {
  const _BaseScreen({
    required this.navigatorKey,
    required this.child,
  });

  final Widget? child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return child ?? const SizedBox.shrink();
  }
}
