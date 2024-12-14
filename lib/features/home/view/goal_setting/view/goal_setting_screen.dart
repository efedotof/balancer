import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/view/goal_setting/cubit/goal_settings_cubit.dart';
import 'package:balancer/features/home/view/goal_setting/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GoalSettingsScreen extends StatefulWidget {
  const GoalSettingsScreen({super.key});

  @override
  State<GoalSettingsScreen> createState() => _GoalSettingsScreenState();
}

class _GoalSettingsScreenState extends State<GoalSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('>>>>>>>>>>>>>>>>>>>>>>>>> start');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Settings'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<GoalSettingsCubit>().createTheBox(context);
            },
            child: const Text(
              'Создать',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormInputTitle(),
            SizedBox(height: 16),
            FormInputAmount(),
            SizedBox(height: 16),
            Text('Select Icon:'),
            SizedBox(height: 8),
            IconPickerGrid(),
            SizedBox(height: 16),
            GoalModeSelector(),
            GoalPercentageSlider(),
          ],
        ),
      ),
    );
  }
}
