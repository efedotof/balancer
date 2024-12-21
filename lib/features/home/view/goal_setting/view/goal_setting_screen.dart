import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/view/goal_setting/cubit/goal_settings_cubit.dart';
import 'package:balancer/features/home/view/goal_setting/widget/widget.dart';
import 'package:balancer/generated/l10n.dart';
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
        title:  Text(S.of(context).goalSettings),
        actions: [
          TextButton(
            onPressed: () {
              context.read<GoalSettingsCubit>().createTheBox(context);
            },
            child:  Text(
              S.of(context).to_create,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormInputTitle(),
            const SizedBox(height: 16),
            const FormInputAmount(),
            const SizedBox(height: 16),
            Text(S.of(context).selectIcon),
            const SizedBox(height: 8),
            const IconPickerGrid(),
            const SizedBox(height: 16),
            const GoalModeSelector(),
            const GoalPercentageSlider(),
          ],
        ),
      ),
    );
  }
}
