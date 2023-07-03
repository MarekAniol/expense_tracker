import 'package:expense_tracker/presentaion/screens/home_screen/home_route.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerAppRouter {
  Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
      case HomeScreen.routeName:
        return homeScreenRoute(settings);
      default:
        return homeScreenRoute(settings);
    }
  }
}
