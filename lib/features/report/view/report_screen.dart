import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/chart_cubit.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/features/report/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        title: const Text('Отчет', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ReportCubit, ReportState>(
              builder: (context, state) {
                final selectedCategory = state.maybeWhen(
                  selected: (category) => category,
                  initial: (category) => category,
                  orElse: () => TransactionCategory.expenses,
                );
                return CategorySelector(selectedCategory: selectedCategory);
              },
            ),
            const SizedBox(height: 30),
            BlocBuilder<ChartCubit, ChartState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    context.read<ChartCubit>().getStatisticsToPie();
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (message) {
                    return Center(child: Text('Error: $message'));
                  },
                  loaded: (incomeStats, expenseStats) {
                    return PieChartDisplay(
                      selectedCategory:
                          context.read<ReportCubit>().state.maybeWhen(
                                selected: (category) => category,
                                initial: (category) => category,
                                orElse: () => TransactionCategory.expenses,
                              ),
                      incomeStats: context
                          .read<ReportCubit>()
                          .adjustStatsToPieData(incomeStats),
                      expenseStats: context
                          .read<ReportCubit>()
                          .adjustStatsToPieData(expenseStats),
                    );
                  }, empty: () => const  Center(child: Text('Трат нет'),),
                );
              },
            ),
            const SizedBox(height: 30),
            const Text('Transactions'),
            BlocBuilder<ReportCubit, ReportState>(
              builder: (context, state) {
                final category = state.maybeWhen(
                  selected: (category) => category,
                  initial: (category) => category,
                  orElse: () => TransactionCategory.expenses,
                );
                return TransactionsList(category: category);
              },
            ),
          ],
        ),
      ),
    );
  }
}
