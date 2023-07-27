import 'package:expense_tracker/expense_tracker_app.dart';
import 'package:expense_tracker/presentaion/injector.dart' as injector;
import 'package:expense_tracker/presentaion/route/expense_tracker_route.dart';
import 'package:expense_tracker/presentaion/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ],
  ).then(
    (_) => _runAppAsync(),
  );
}

Future<void> _runAppAsync() async {
  await injector.init();
  runApp(
    ExpenseTrackerApp(
      appRouter: ExpenseTrackerAppRouter(),
      appTheme: AppTheme(),
    ),
  );
}
