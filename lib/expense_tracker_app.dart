import 'package:expense_tracker/presentaion/route/expense_tracker_route.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerApp extends StatelessWidget {
  ExpenseTrackerApp({
    required this.appRouter,
    super.key,
  });
  final navigatorKey = GlobalKey<NavigatorState>();
  final ExpenseTrackerAppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: appRouter.route,
      builder: (context, child) => _BaseScreen(
        navigatorKey: navigatorKey,
        child: child,
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
