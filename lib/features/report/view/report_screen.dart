import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/chart_cubit.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/features/report/widget/widget.dart';
import 'package:balancer/generated/l10n.dart';
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
        title:  Text(S.of(context).reply, style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              BlocBuilder<ReportCubit, ReportState>(
                builder: (context, reportState) {
                  final selectedCategory = reportState.maybeWhen(
                    selected: (category) => category,
                    initial: (category) => category,
                    orElse: () => TransactionCategory.expenses,
                  );
          
                  return BlocBuilder<ChartCubit, ChartState>(
                    builder: (context, chartState) {
                      return chartState.when(
                        initial: () {
                          context.read<ChartCubit>().getStatisticsToPie();
                          return const Center(child: CircularProgressIndicator());
                        },
                        error: (message) {
                          return Center(child: Text('Error: $message'));
                        },
                        loaded: (incomeStats, expenseStats) {
                          final hasNoData = selectedCategory ==
                                  TransactionCategory.income
                              ? incomeStats.values.every((value) => value == 0.0)
                              : expenseStats.values
                                  .every((value) => value == 0.0);
          
                          if (hasNoData) {
                            return Center(
                              child: Text(
                                selectedCategory == TransactionCategory.income
                                    ? S.of(context).there_is_no_income
                                    : S.of(context).t_no,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.grey),
                              ),
                            );
                          }
          
                          return PieChartDisplay(
                            selectedCategory: selectedCategory,
                            incomeStats:
                                selectedCategory == TransactionCategory.income
                                    ? context
                                        .read<ReportCubit>()
                                        .adjustStatsToPieData(incomeStats)
                                    : {},
                            expenseStats:
                                selectedCategory == TransactionCategory.expenses
                                    ? context
                                        .read<ReportCubit>()
                                        .adjustStatsToPieData(expenseStats)
                                    : {},
                          );
                        },
                        empty: () =>  Center(child: Text(S.of(context).t_no)),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
            
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
      ),
    );
  }
}
