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
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
        ),
        body: child,
      ),
    );
  }
}
