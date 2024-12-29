import 'package:balancer/features/home/view/goal_add/cubit/goal_add_cubit.dart';
import 'package:balancer/features/home/view/goal_add/providers/goals_provider.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormInputTitle extends StatelessWidget {
  const FormInputTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:  InputDecoration(labelText: S.of(context).title),
      onChanged: (value) {
        context.read<GoalsProvider>().changeTitle(newTitle: value.trim());
        context.read<GoalAddCubit>().updateTitle(value.trim());
      },
    );
  }
}
