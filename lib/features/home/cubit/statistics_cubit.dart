import 'package:balancer/box/models/transactions.dart';
import 'package:balancer/box/statistics/repository/statistics_interface.dart';
import 'package:balancer/box/statistics/statistics.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'statistics_state.dart';
part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit({required StatisticsInterface interface}) : _interface = interface, super(const StatisticsState.initial()){
  getStatistics();
  }

  final StatisticsInterface _interface;

  Future<void> getStatistics() async{
    try {
      final box = Hive.box<Statistics>('Statistics_box');
      if(box.isNotEmpty){
        final res = box.getAt(0)!;
        emit(StatisticsState.notEmpty(amountExpense: res.amountExpenses, amountIncome: res.amountIncome));

      }else{
        emit(const StatisticsState.empty());
      }

    } catch (e) {
      debugPrint('error statistics: $e');
    }
  
  }

  Future<void> addStatistics({required int amountExpenses, required int amountIncome, required List<Transactions>? transExpense, required List<Transactions>? transIncome}) async{
    try {
      if(transExpense != null || transIncome != null){
        _interface.boxAdd(amountExpenses, amountIncome, transExpense ?? [], transIncome?? []);
      }else{
         _interface.boxAdd(amountExpenses, amountIncome,  [],[]);
      }
    } catch (e) {
      debugPrint('error add Statics: $e');
    }


  
  
  }




}
