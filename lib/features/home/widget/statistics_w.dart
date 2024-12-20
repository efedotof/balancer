import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/widget/statistics_card.dart';
import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';

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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
              children: [
                Icon(Icons.bar_chart_outlined),
                SizedBox(width: 10),
                Text('Statistics'),
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
                    textCard: 'Expense',
                    balanceCard: '- $expense ₽',
                    buttomColor: const Color(0xFFFFC4DB),
                    less: less(income, expense), onTaps: () {context.pushRoute(const ReportRoute());},
                  ),
                ),
                Flexible(
                  child: StatisticsCard(
                    colorsCard: const Color(0xFFBDC2DC),
                    textCard: 'Income',
                    balanceCard: '$income ₽',
                    buttomColor: const Color(0xFFC4D0FF),
                    less: less(expense, income), onTaps: () {context.pushRoute(const ReportRoute());},
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
