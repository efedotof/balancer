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
              final groupedTransactions = context.read<HomeCubit>().groupTransactionsByDate(transactions);

          
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

                                final headerTitle = context.read<HomeCubit>().isToday(date)
                                    ? 'Сегодня'
                                    : context.read<HomeCubit>().formatDate(date); 

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
  
}
