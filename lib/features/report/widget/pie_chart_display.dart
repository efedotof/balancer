import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/chart_cubit.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PieChartDisplay extends StatelessWidget {
  final TransactionCategory selectedCategory;

  const PieChartDisplay({
    super.key,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartCubit, ChartState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (incomeStats, expenseStats) {
            Map<String, int> stats =
                selectedCategory == TransactionCategory.expenses
                    ? expenseStats
                    : incomeStats;

            int total = stats.values.reduce((a, b) => a + b);
            String centerText = context.read<ChartCubit>().getCenterText(
                  stats,
                  selectedCategory == TransactionCategory.expenses
                      ? 'expenses'
                      : 'income',
                );

            List<Color> sectionColors = [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.indigo,
              Colors.purple,
            ];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // График
                Center(
                  child: EasyPieChart(
                    pieType: PieType.crust,
                    showValue: false,
                    style: const TextStyle(fontSize: 10),
                    borderEdge: StrokeCap.round,
                    borderWidth: 20,
                    size: 160,
                    centerText: centerText,
                    centerStyle: const TextStyle(color: Colors.white, fontSize: 25),
                    children: context.read<ChartCubit>().generatePieData(stats, sectionColors),
                  ),
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: context.read<ChartCubit>().colorCategoryWidgets(
                      stats,
                      total,
                      sectionColors,
                    ),
                  ),
                ),
              ],
            );
          },
          error: (e) => Center(child: Text('Error: $e')),
          orElse: () => const Center(child: CircularProgressIndicator())
          
        );
      },
    );
  }
}
