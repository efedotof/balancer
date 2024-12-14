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

    bool allIncomeZero = incomeStats.values.every((value) => value == 0.0);
    bool allExpenseZero = expenseStats.values.every((value) => value == 0.0);

    // Общая сумма для расходов или доходов
    double total = selectedCategory == TransactionCategory.expenses
        ? expenseStats.values.reduce((a, b) => a + b)
        : incomeStats.values.reduce((a, b) => a + b);

    // Текст в центре графика
    String centerText = '';
    if (selectedCategory == TransactionCategory.expenses && allExpenseZero) {
      centerText = 'Уххх....ты....';
    } else if (selectedCategory == TransactionCategory.income && allIncomeZero) {
      centerText = 'Уххх....ты....';
    } else {
      centerText = total.toStringAsFixed(2); // Отображение суммы с двумя знаками после запятой
    }

    // Список цветов для секций
    List<Color> sectionColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    // Генератор данных для секций
    List<PieData> _generatePieData(Map<String, double> stats) {
      int colorIndex = 0;
      return stats.entries.map((entry) {
        final color = sectionColors[colorIndex % sectionColors.length];
        colorIndex++;
        return PieData(
          value: entry.value,
          color: color,
        );
      }).toList();
    }

    return EasyPieChart(
      pieType: PieType.crust,
      style: const TextStyle(fontSize: 10),
      borderEdge: StrokeCap.round,
      borderWidth: 20,
      size: 160,
      centerText: centerText, // Показываем сумму в центре
      centerStyle: const TextStyle(color: Colors.white, fontSize: 25),
      children: selectedCategory == TransactionCategory.expenses
          ? _generatePieData(expenseStats)
          : _generatePieData(incomeStats),
    );
  }
}
