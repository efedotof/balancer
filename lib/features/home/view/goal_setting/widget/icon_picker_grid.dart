import 'package:balancer/Theme/constants/constants.dart';
import 'package:balancer/features/home/view/goal_setting/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IconPickerGrid extends StatelessWidget {
  const IconPickerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: IconPicker.availableIcons.length,
        itemBuilder: (context, index) {
          final icon = IconPicker.availableIcons[index];
          final isSelected = context.watch<GoalsProvider>().icon == icon;

          return GestureDetector(
            onTap: () {
              context.read<GoalsProvider>().changeIcon(newIcon: icon);
              context.read<GoalsProvider>().changeCodes(newCodes: icon.codePoint);
            },
            child: Card(
              color: isSelected ? Colors.blue : Colors.grey[200],
              child: Icon(
                icon,
                size: 36,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}