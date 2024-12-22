import 'package:balancer/box/models/transactions.dart';
import 'package:balancer/features/new_transaction/cubit/cubit/providers/add_new_goals_provider.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/new_transaction/widget/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'total_cubit.dart';

part 'add_row_state.dart';
part 'add_row_cubit.freezed.dart';

class AddRowCubit extends Cubit<AddRowState> {
  AddRowCubit() : super(const AddRowState.initial());

  List<TransactionItem> transaction = [];
  List<Transactions> transactionsList = [];
  List<TransactionCategoryTitle> categorys = [];
  int total = 0;

  void addRow(BuildContext context, {required TransactionItem transactions, required TransactionCategoryTitle category}) {

    transaction.add(transactions);
    transactionsList.add(Transactions(
        amount: transactions.amount.toInt(),
        nameTrans: transactions.categoryTitle,
        date: DateTime.now()));
    categorys.add(category);

    emit(AddRowState.updateRow(
    category: categorys,
        transaction: List.from(
            transaction))); 

    context
        .read<TotalCubit>()
        .changeTotalBudget(amountsTotal: transactions.amount.toInt());

    debugPrint("Current transactionsList: ${transactionsList.length}");
  }

  void transToClean(BuildContext context) {
    transaction.clear();
    transactionsList.clear();
    categorys.clear();
    if(context.mounted){
      context.read<AddNewGoalsProvider>().goalsSelectToClean();
    }
    emit(const AddRowState.initial());
  }
}
