import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/widget/statistics_card.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsW extends StatelessWidget {
  const StatisticsW({super.key, required this.income, required this.expense});

  final int income;
  final int expense;

  bool less(int income, int expense) {
    return income <= expense;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                const Icon(Icons.bar_chart_outlined),
                const SizedBox(width: 10),
                Text(S.of(context).statistics),
              ],
            ),
          
          ],
        ),
        subtitle: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: StatisticsCard(
                    
                    colorsCard: const Color(0xFFD8BAC6),
                    textCard: S.of(context).expense,
                    balanceCard: '- $expense ₽',
                    buttomColor: const Color(0xFFFFC4DB),
                    less: less(income, expense), onTaps: () {
                    context.read<ReportCubit>().selectCategory(TransactionCategory.expenses);
                    context.pushRoute(const ReportRoute());},
                  ),
                ),
                Flexible(
                  child: StatisticsCard(
                    colorsCard: const Color(0xFFBDC2DC),
                    textCard: S.of(context).income,
                    balanceCard: '$income ₽',
                    buttomColor: const Color(0xFFC4D0FF),
                    less: less(expense, income), onTaps: () {
                    context.read<ReportCubit>().selectCategory(TransactionCategory.income);
                    context.pushRoute(const ReportRoute());},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
