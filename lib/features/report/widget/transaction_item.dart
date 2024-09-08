import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount; 
  final Color amountColor;

  const TransactionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: Text(
        '${context.read<ReportCubit>().formatAmount(amount)} ₽',
        style: TextStyle(color: amountColor, fontSize: 18),
      ),
    );
  }
}
