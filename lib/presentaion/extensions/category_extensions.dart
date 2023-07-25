import 'package:expense_tracker/domain/models/expense.dart';
import 'package:flutter/material.dart';

extension CategoryExtensions on Category {
  Icon getIcon(Color color) {
    String categoryToCheck = toString().split('.').last;

    if (CategoryIcon.values.any((v) => v.toString().split('.').last == categoryToCheck)) {
      return Icon(
        CategoryIcon.values
            .firstWhere((v) => v.toString().split('.').last == categoryToCheck)
            .icon
            .icon,
        color: color,
      );
    } else {
      return Icon(
        CategoryIcon.none.icon.icon,
        color: color,
      );
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
      case CategoryIcon.travels:
        return Category.travels;
      case CategoryIcon.shopping:
        return Category.shopping;
      case CategoryIcon.health:
        return Category.health;
      case CategoryIcon.entertainment:
        return Category.entertainment;
      case CategoryIcon.sport:
        return Category.sport;
      default:
        throw ArgumentError('Invalid enum value: $this');
    }
  }
}

enum CategoryIcon {
  food(icon: Icon(Icons.restaurant)),
  travels(icon: Icon(Icons.card_travel)),
  shopping(icon: Icon(Icons.shopping_cart)),
  health(icon: Icon(Icons.health_and_safety)),
  entertainment(icon: Icon(Icons.attractions)),
  sport(icon: Icon(Icons.fitness_center)),
  none(icon: Icon(Icons.close));

  const CategoryIcon({
    required this.icon,
  });

  final Icon icon;
}
