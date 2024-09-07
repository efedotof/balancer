import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color amountColor;
  final DateTime date;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.date,
  });



  @override
  Widget build(BuildContext context) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    final formattedDate = '$day.$month.$year  $hour:$minute';


    final doubleAmount = double.tryParse(amount.replaceAll(',', '.')) ?? 0.0;
    final formattedAmount =context.read<HomeCubit>().formatNumber(doubleAmount);

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0), 
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis, 
      ),
      subtitle: Text(
        formattedDate,
        style: const TextStyle(color: Colors.white70),
        overflow: TextOverflow.ellipsis, 
      ),
      trailing: SizedBox(
        width: 120, 
        child: Text(
          textAlign: TextAlign.end,
          '$formattedAmount ₽',
          style: TextStyle(color: amountColor, fontSize: 18),
          overflow: TextOverflow.ellipsis, 
          maxLines: 1, 
        ),
      ),
    );
  }
}
