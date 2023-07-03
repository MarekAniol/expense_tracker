import 'package:expense_tracker/presentaion/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> homeScreenRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => const HomeScreen(),
  );
}
