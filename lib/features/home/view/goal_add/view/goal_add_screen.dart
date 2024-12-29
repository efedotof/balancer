import 'package:auto_route/auto_route.dart';
import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/features/home/view/goal_add/cubit/goal_add_cubit.dart';
import 'package:balancer/features/home/view/goal_add/widget/widget.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GoalAddScreen extends StatefulWidget {
  const GoalAddScreen({super.key});

  @override
  State<GoalAddScreen> createState() => _GoalAddScreenState();
}

class _GoalAddScreenState extends State<GoalAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).goalSettings),
        leading: IconButton(
            onPressed: () {
              context.maybePop();
              context.read<GoalsProvider>().clear();
            } ,
            
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
           TextButton(
                  onPressed: () {
                    context.read<GoalAddCubit>().createTheBox(context);
                  },
                  child: Text(
                    S.of(context).to_create,
                    // style: const TextStyle(),
                  ),
                )
              // : const SizedBox.shrink()
        ],
      ),
      body: Padding(
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
