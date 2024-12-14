import 'package:balancer/features/home/view/goal_setting/cubit/goal_settings_cubit.dart';
import 'package:balancer/features/home/view/goal_setting/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormInputAmount extends StatelessWidget {
  const FormInputAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Amount'),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final amount = double.tryParse(value);
        if (amount != null && amount > 0) {
          context.read<GoalsProvider>().changeAmount(newAmount: amount);
          context.read<GoalSettingsCubit>().updateAmount(amount);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a valid amount.')),
          );
        }
      },
    );
  }
}