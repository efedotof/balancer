import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/features/report/cubit/switch_cubit.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPieChart extends StatelessWidget {
  const ReportPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportUpdated) {
          final transactions = state.transactions;
          final categoryTotals = state.categoryTotals;
          final totalAmount = state.totalAmount;

          if (transactions.isEmpty) {
            return Center(
              child: Text(
                context.read<SwitchCubit>().state
                    ? 'Нет данных по доходам.\nДобавьте транзакцию.'
                    : 'Нет данных по расходам.\nДобавьте транзакцию.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final List<PieData> pieData = categoryTotals.entries.map((entry) {
            final percentage = (entry.value / totalAmount) * 100;
            return PieData(
              value: percentage,
              color: context.read<ReportCubit>().getColorForCategory(entry.key),
            );
          }).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            EasyPieChart(
                              key: const Key('pie 1'),
                              children: pieData,
                              centerText: '',
                              centerStyle: const TextStyle(fontSize: 14),
                              borderEdge: StrokeCap.butt,
                              pieType: PieType.crust,
                              onTap: (index) {},
                              style: const TextStyle(
                                color: Colors.transparent,
                                fontSize: 10,
                              ),
                              gap: 0,
                              start: 0,
                              size: 130,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  context
                                      .read<ReportCubit>()
                                      .formatAmount(totalAmount.toString()),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: categoryTotals.entries.map((entry) {
                        final percentage = (entry.value / totalAmount) * 100;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                color: context
                                    .read<ReportCubit>()
                                    .getColorForCategory(entry.key),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${entry.key}: ${percentage.toStringAsFixed(2)}%',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        }

        return Center(
          child: Text(
            context.read<SwitchCubit>().state
                ? 'Нет данных по доходам.\nДобавьте транзакцию.'
                : 'Нет данных по расходам.\nДобавьте транзакцию.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
      },
    );
  }
}
