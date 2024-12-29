import 'package:balancer/features/home/view/goal_add/cubit/goal_add_cubit.dart';
import 'package:balancer/features/home/view/goal_add/providers/goals_provider.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalModeSelector extends StatelessWidget {
  const GoalModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalAddCubit, GoalAddState>(
      builder: (context, state) {
        final mode = state.mode;
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<GoalsProvider>().changeMode(newMode: GoalMode.manual);
                  context.read<GoalAddCubit>().updateMode(GoalMode.manual);
                },
                child: Card(
                  color: mode == GoalMode.manual
                      ? Colors.blue
                      : Colors.grey[200],
                  child:  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: Text(S.of(context).manual, style: TextStyle(color: mode == GoalMode.manual? Colors.white: Colors.black ),)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<GoalsProvider>().changeMode(newMode: GoalMode.percentage);
                  context.read<GoalAddCubit>().updateMode(GoalMode.percentage);
                },
                child: Card(
                  color: mode == GoalMode.percentage
                      ? Colors.blue
                      : Colors.grey[200],
                  child:  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: Text(S.of(context).percentage, style: TextStyle(color: mode == GoalMode.percentage? Colors.white: Colors.black),)),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}