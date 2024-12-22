import 'package:balancer/features/home/view/goal_setting/cubit/goal_settings_cubit.dart';
import 'package:flutter/material.dart';

class GoalsProvider with ChangeNotifier {
  String title = '';
  double amount = 0.0;
  IconData icon = Icons.abc;
  GoalMode mode = GoalMode.manual;
  double? percentage;
  int codes = 0;
  bool isValue = false;

  void changeValue({required bool newValue}) {
    isValue = newValue;
    notifyListeners();
  }

  void changeTitle({required String newTitle}) {
    title = newTitle;
    notifyListeners();
  }

  void changeAmount({required double newAmount}) {
    amount = newAmount;
    notifyListeners();
  }

  void changeIcon({required IconData newIcon}) {
    icon = newIcon;
    notifyListeners();
  }

  void changeMode({required GoalMode newMode}) {
    mode = newMode;
    notifyListeners();
  }

  void changePercentage({required double? newPercentage}) {
    debugPrint('changePercentage to Provider : $newPercentage');
    percentage = newPercentage;
    notifyListeners();
  }

  void changeCodes({required int newCodes}) {
    codes = newCodes;
    notifyListeners();
  }

  void clear() {
    title = '';
    amount = 0.0;
    icon = Icons.abc;
    mode = GoalMode.manual;
    percentage = null;
    codes = 0;
    isValue = false;
    notifyListeners();
  }
}
