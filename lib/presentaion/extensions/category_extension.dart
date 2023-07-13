import 'package:expense_tracker/domain/models/expense.dart';
import 'package:flutter/material.dart';

extension CategoryExtensions on Category {
  Icon get getIcon {
    String categoryToCheck = toString().split('.').last;

    if (CategoryIcon.values.any((v) => v.toString().split('.').last == categoryToCheck)) {
      return CategoryIcon.values
          .firstWhere((v) => v.toString().split('.').last == categoryToCheck)
          .icon;
    } else {
      return CategoryIcon.none.icon;
    }
  }
}

enum CategoryIcon {
  food(icon: Icon(Icons.food_bank)),
  transport(icon: Icon(Icons.car_rental)),
  shopping(icon: Icon(Icons.shop)),
  health(icon: Icon(Icons.health_and_safety)),
  entertainment(icon: Icon(Icons.show_chart)),
  others(icon: Icon(Icons.car_rental)),
  none(icon: Icon(Icons.close));

  const CategoryIcon({
    required this.icon,
  });

  final Icon icon;
}
