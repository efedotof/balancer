import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';

class PieChartDisplay extends StatelessWidget {
  final TransactionCategory selectedCategory;
  final Map<String, double> incomeStats;
  final Map<String, double> expenseStats;

  const PieChartDisplay({
    super.key,
    required this.selectedCategory,
    required this.incomeStats,
    required this.expenseStats,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(incomeStats.toString());
    
    // Проверяем, если все значения в incomeStats или expenseStats равны 0.0
    bool allIncomeZero = incomeStats.values.every((value) => value == 0.0);
    bool allExpenseZero = expenseStats.values.every((value) => value == 0.0);
    
    String centerText = '';
    if (selectedCategory == TransactionCategory.expenses && allExpenseZero) {
      centerText = 'Уххх....ты....';
    } else if (selectedCategory == TransactionCategory.income && allIncomeZero) {
      centerText = 'Уххх....ты....';
    } else {
      centerText = selectedCategory == TransactionCategory.expenses
          ? 'Total Expense'
          : 'Total Income';
    }

    return EasyPieChart(
      pieType: PieType.crust,
      style: const TextStyle(fontSize: 10),
      borderEdge: StrokeCap.round,
      borderWidth: 20,
      size: 160,
      centerText: centerText,
      centerStyle: const TextStyle(color: Colors.white, fontSize: 25),
      children: selectedCategory == TransactionCategory.expenses
          ? expenseStats.entries.map((entry) {
              return PieData(
                value: entry.value,
                color: Colors.red,
              );
            }).toList()
          : incomeStats.entries.map((entry) {
              return PieData(
                value: entry.value,
                color: Colors.blue,
              );
            }).toList(),
    );
  }
}
