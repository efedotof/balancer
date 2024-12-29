import 'package:balancer/box/statistics/repository/statistics_interface.dart';
import 'package:balancer/box/statistics/statistics.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit({required StatisticsInterface interface})
      : _interface = interface,
        super(const StatisticsState.initial()) {
    getStatistics();
  }

  final StatisticsInterface _interface;

  Future<void> getStatistics() async {
    try {
      _interface.boxAdd(
        0,
        0,
      );
      final box = Hive.box<Statistics>('Statistics_box');
      if (box.isNotEmpty) {
        final res = box.getAt(0)!;
        emit(StatisticsState.notEmpty(
            amountExpense: res.amountExpenses, amountIncome: res.amountIncome));
      } else {
        emit(const StatisticsState.empty());
      }
    } catch (e) {
      debugPrint('error statistics: $e');
    }
  }

  Future<void> addStatistics({
    required double amountExpenses,
    required double amountIncome,
  }) async {
    try {
      _interface.boxAdd(
        amountExpenses,
        amountIncome,
      );
    } catch (e) {
      debugPrint('error add Statics: $e');
    }
  }

 Future<void> uploadStatistics({required double amountExpenses,required  double amountIncome}) async {
  try {
    var box = Hive.box<Statistics>('Statistics_box');
    final statistics = box.isNotEmpty ? box.getAt(0) : null;
    if (statistics != null) {
    
      if (amountExpenses != 0) {
        _interface.updateAmounts(0, amountExpenses, 0);
        
      } else {
        _interface.updateAmounts(0, 0, amountIncome);
      }
    } else {
      debugPrint('is null to upload');
    }
    
    emit(StatisticsState.uploadStatistics(amountExpense: statistics!.amountExpenses, amountIncome: statistics.amountIncome));
  } catch (e) {
    debugPrint('Error uploading statistics: $e');
  }
}

}
