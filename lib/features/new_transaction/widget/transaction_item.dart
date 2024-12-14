

import 'category.dart';

class TransactionItem {
  final TransactionCategory category;
  final double amount;
  final String categoryTitle;

  TransactionItem({
    required this.category,
    required this.amount,
    required this.categoryTitle,
  });
}