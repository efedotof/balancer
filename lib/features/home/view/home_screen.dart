import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/transaction.dart';
import 'package:balancer/constants.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final transactionsNotifier = context.read<HomeCubit>().transactionsNotifier;

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(AppStrings.appBarTitleHome, style: AppTextStyles.appBarTitle),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => context.read<HomeCubit>().showAddModel(context),
              ),
            ],
          ),
          body: ValueListenableBuilder<List<Transaction>>(
            valueListenable: transactionsNotifier,
            builder: (context, transactions, _) {
              final groupedTransactions = _groupTransactionsByDate(transactions);

          
              final sortedDates = groupedTransactions.keys.toList()
                ..sort((a, b) => b.compareTo(a)); 

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.padding),
                  child: Column(
                    children: [
          
                      const CardInfo(),
                      const SizedBox(height: AppSizes.cardSpacing),
                      Filters(
                        nameChip: context.read<HomeCubit>().nameChip,
                      ),
                      const SizedBox(height: AppSizes.cardSpacing),
                      transactions.isEmpty
                          ? const Center(
                              child: Text(AppStrings.noTransactions, style: AppTextStyles.emptyTransactions,textAlign: TextAlign.center,),
                            )
                          : Column(
                              children: sortedDates.map((date) {
                                final transactionsForDate = groupedTransactions[date]!.reversed.toList();

                                final headerTitle = _isToday(date)
                                    ? 'Сегодня'
                                    : _formatDate(date); 

                                return TransactionList(
                                  headerTitle: headerTitle,
                                  transactions: transactionsForDate,
                                );
                              }).toList(),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  Map<DateTime, List<Transaction>> _groupTransactionsByDate(List<Transaction> transactions) {
    final Map<DateTime, List<Transaction>> groupedTransactions = {};

    for (var transaction in transactions) {
      final transactionDate = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      ); 

      if (!groupedTransactions.containsKey(transactionDate)) {
        groupedTransactions[transactionDate] = [];
      }
      groupedTransactions[transactionDate]!.add(transaction);
    }

    return groupedTransactions;
  }


  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    return '$day.$month.$year'; 
  }
}
