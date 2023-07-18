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

extension CategoryIconExtension on List<CategoryIcon> {
  List<CategoryIcon> get getCategories {
    return where(
      (category) => category != CategoryIcon.none,
    ).map((category) => category).toList();
  }
}

extension CategoryConverter on CategoryIcon {
  Category get toCategory {
    switch (this) {
      case CategoryIcon.food:
        return Category.food;
      case CategoryIcon.transport:
        return Category.transport;
      case CategoryIcon.shopping:
        return Category.shopping;
      case CategoryIcon.health:
        return Category.health;
      case CategoryIcon.entertainment:
        return Category.entertainment;
      case CategoryIcon.others:
        return Category.others;
      default:
        throw ArgumentError('Invalid enum value: $this');
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
