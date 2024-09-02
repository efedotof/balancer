import 'package:balancer/box/repository/box_interface.dart';
import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required BoxInterface boxInterface,
    required this.prefs,
    required this.homeCubit,
    required this.balancerCubit,
  }) : _boxInterface = boxInterface, super(SettingsInitial());

  final BoxInterface _boxInterface;
  final SharedPreferences prefs;
  final HomeCubit homeCubit;
  final BalancerCubit balancerCubit;

  void _clearAppCash() async {
    await _boxInterface.removeAllBox();
    prefs.clear();
    
    homeCubit.clearTransactions();
    balancerCubit.resetBalance();
  }

  void clearAll(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Подтвердите удаление"),
          content: const Text("Вы уверены, что хотите удалить этот элемент?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Отмена"),
            ),
            TextButton(
              onPressed: () => _clearAppCash(),
              child: const Text("Удалить"),
            ),
          ],
        );
      },
    );

  }



}
