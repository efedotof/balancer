import 'package:balancer/features/home/view/goal_add/cubit/goal_add_cubit.dart';
import 'package:balancer/features/home/view/goal_add/providers/goals_provider.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormInputAmount extends StatelessWidget {
  const FormInputAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:  InputDecoration(labelText: S.of(context).amount),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final amount = double.tryParse(value);
        if (amount != null && amount > 0) {
          context.read<GoalsProvider>().changeAmount(newAmount: amount);
          context.read<GoalAddCubit>().updateAmount(amount);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).pleaseEnterAValidAmount)),
          );
        }
      },
    );
  }
}
