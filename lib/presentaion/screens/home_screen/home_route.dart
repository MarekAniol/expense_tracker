import 'package:expense_tracker/presentaion/injector.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:expense_tracker/presentaion/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> homeScreenRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => BlocProvider(
      create: (context) => injector<HomeScreenBloc>()
        ..add(
          const HomeScreenEvent.getAllExpensesRequested(),
        ),
      child: const HomeScreen(),
    ),
  );
}
