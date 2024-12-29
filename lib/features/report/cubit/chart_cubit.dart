import 'package:balancer/box/incomeAndExpense/repository/income_and_expense_interface.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_state.dart';
part 'chart_cubit.freezed.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit({required IncomeAndExpenseInterface interface})
      : _interface = interface,
        super(const ChartState.initial());

  final IncomeAndExpenseInterface _interface;


  void getStatisticsToPie() async {
    try {
      final incomeStats = await _interface.getIncomeStats();
      final expenseStats = await _interface.getExpenseStats();

     
      final adjustedIncomeStats = _adjustCategoryStats(incomeStats, 'income');
      final adjustedExpenseStats = _adjustCategoryStats(expenseStats, 'expenses');


      emit(ChartState.loaded(
        incomeStats: adjustedIncomeStats,
        expenseStats: adjustedExpenseStats,
      ));
    } catch (e) {
      emit(ChartState.error(e.toString()));
    }
  }


  Map<String, double> _adjustCategoryStats(Map<String, double> stats, String category) {
    Map<String, double> adjustedStats = {};

    stats.forEach((name, amount) {
      adjustedStats[name] = amount; 
    });

    return adjustedStats;
  }


  String getCenterText(Map<String, double> stats, String category) {
    bool allZero = stats.values.every((value) => value == 0);
    double total = stats.values.reduce((a, b) => a + b);

    if (allZero) {
      return 'No data'; 
    }

    return total.toStringAsFixed(2); 
  }


  List<PieData> generatePieData(Map<String, double> stats, List<Color> sectionColors) {
    int colorIndex = 0;
    return stats.entries.map((entry) {
      final color = sectionColors[colorIndex % sectionColors.length];
      colorIndex++;
      return PieData(
        value: entry.value.toDouble(),
        color: color,
      );
    }).toList();
  }


  List<Widget> colorCategoryWidgets(BuildContext context, Map<String, double> stats, double total, List<Color> sectionColors) {
    int colorIndex = 0;
    
    
    return stats.entries.map((entry) {
    debugPrint(entry.key);
      final color = sectionColors[colorIndex % sectionColors.length];
      colorIndex++;
      double percentage = (entry.value / total) * 100;
      return Row(
        children: [
          Container(
            width: 20,
            height: 20,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(name(context, entry.key)), 
          const SizedBox(width: 8),
          Text('${percentage.toStringAsFixed(1)}%'), 
        ],
      );
    }).toList();
  }
}