import 'package:expense_tracker/domain/models/expense.dart';
import 'package:hive/hive.dart';

part 'expense_local_model.g.dart';

@HiveType(typeId: 0)
class ExpenseLocalModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final int category;

  ExpenseLocalModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

extension ExpenseLocalModelExtension on ExpenseLocalModel {
  Expense toDomainModel() {
    return Expense(
      id: id,
      title: title,
      amount: amount,
      date: date,
      category: Category.values[category],
    );
  }
}

extension ExpenseExtension on Expense {
  ExpenseLocalModel toLocalModel() {
    return ExpenseLocalModel(
      id: id,
      title: title,
      amount: amount,
      date: date,
      category: category.index,
    );
  }
}
