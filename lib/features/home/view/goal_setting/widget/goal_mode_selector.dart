import 'package:balancer/features/home/view/goal_setting/cubit/goal_settings_cubit.dart';
import 'package:balancer/features/home/view/goal_setting/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalModeSelector extends StatelessWidget {
  const GoalModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalSettingsCubit, GoalSettingsState>(
      builder: (context, state) {
        final mode = state.mode;
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<GoalsProvider>().changeMode(newMode: GoalMode.manual);
                  context.read<GoalSettingsCubit>().updateMode(GoalMode.manual);
                },
                child: Card(
                  color: mode == GoalMode.manual
                      ? Colors.blue
                      : Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: Text('Manual')),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<GoalsProvider>().changeMode(newMode: GoalMode.percentage);
                  context.read<GoalSettingsCubit>().updateMode(GoalMode.percentage);
                },
                child: Card(
                  color: mode == GoalMode.percentage
                      ? Colors.blue
                      : Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: Text('Percentage')),
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