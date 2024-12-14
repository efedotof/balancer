import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/home/cubit/budget_cubit.dart';

import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:balancer/features/home/cubit/statistics_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/add_row_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/total_cubit.dart';
import 'package:balancer/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widget/widget.dart';
import 'goal_setting/cubit/goals_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            actions: [
              IconButton(
                  icon: const Icon(Icons.notifications), onPressed: () {}),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Wrap(
                runSpacing: 10,
                children: [
                  const Text(
                    'Analytics',
                    style: TextStyle(fontSize: 22),
                  ),
                  BlocBuilder<BudgetCubit, BudgetState>(
                    builder: (context, state) {
                      final state = context.read<BudgetCubit>().state;
                      return state.when(
                        initial: () => const CardInfo(
                          nameCard: "",
                          goalAmount: '',
                          leadingWindget: null,
                          spent: '',
                          left: '',
                          loading: true,
                        ),
                        empty: () => CardInfo(
                          nameCard: "Monthly budget",
                          leadingWindget: const Icon(Icons.add),
                          subtitles: 'Определите ежемесячный бюджет',
                          onTap: () =>
                              context.pushRoute(const AddBudgetRoute()),
                        ),
                        isNotEmpty: (amount, spent, left) => CardInfo(
                          nameCard: "Monthly budget",
                          goalAmount:
                              "${(amount.toInt()).toString()} ₽", // округляем до 2 знаков
                          leadingWindget: const Icon(Icons.monetization_on),
                          spent:
                              'spent ${spent!.toStringAsFixed(2)} ₽/${(context.read<HomeCubit>().calculateProgress(spent.toDouble(), amount.toDouble()) * 100).toStringAsFixed(2)}%',
                          left:
                              'left ${left!.toStringAsFixed(2)} ₽/${(context.read<HomeCubit>().calculateProgress(left.toDouble(), amount.toDouble()) * 100).toStringAsFixed(2)}%',
                          progress: context.read<HomeCubit>().calculateProgress(
                              spent.toDouble(), amount.toDouble()),
                        ),
                        updateBudget: (amountBudget, spent, left) => CardInfo(
                          nameCard: "Monthly budget",
                          goalAmount: "${(amountBudget.toInt()).toString()} ₽",
                          leadingWindget: const Icon(Icons.monetization_on),
                          spent:
                              'spent ${spent!.toStringAsFixed(2)} ₽/${(context.read<HomeCubit>().calculateProgress(spent.toDouble(), amountBudget.toDouble()) * 100).toStringAsFixed(2)}%',
                          left:
                              'left ${left!.toStringAsFixed(2)} ₽/${(context.read<HomeCubit>().calculateProgress(left.toDouble(), amountBudget.toDouble()) * 100).toStringAsFixed(2)}%',
                          progress: context.read<HomeCubit>().calculateProgress(
                              spent.toDouble(), amountBudget.toDouble()),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<StatisticsCubit, StatisticsState>(
                    builder: (context, state) {
                      final state = context.read<StatisticsCubit>().state;

                      return state.when(
                        initial: () => const StatisticsW(
                          income: 0,
                          expense: 0,
                        ),
                        empty: () => const StatisticsW(
                          income: 0,
                          expense: 0,
                        ),
                        notEmpty: (int amountExpense, int amountIncome) =>
                            StatisticsW(
                          income: amountIncome,
                          expense: amountExpense,
                        ),
                        uploadStatistics:
                            (int amountExpense, int amountIncome) =>
                                StatisticsW(
                          income: amountIncome,
                          expense: amountExpense,
                        ),
                      );
                    },
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocBuilder<GoalsCubit, GoalsState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () =>
                                  context.pushRoute(const GoalSettingsRoute()),
                              child: const CardInfo(
                                nameCard: 'Add new goals',
                                goalAmount: '',
                                leadingWindget: Icon(Icons.money_outlined),
                                spent: '',
                                left: '',
                                trailingW: Icon(Icons.add),
                              ),
                            );
                          },
                        ),
                        ValueListenableBuilder<Box<Goals>>(
                            valueListenable:
                                Hive.box<Goals>('goals_box').listenable(),
                            builder: (context, Box<Goals> box, _) {
                              return box.values.isNotEmpty
                                  ? SingleChildScrollView(
                                      child: Column(
                                        children: List.generate(
                                            box.values.length, (index) {
                                          Goals res = box.getAt(index)!;

                                          return CardInfo(
                                              nameCard: res.nameGoals,
                                              goalAmount:
                                                  '${res.goalsAmount} ₽',
                                              leadingWindget:  Icon(IconData(res.iconCode, fontFamily: 'MaterialIcons')),
                                              spent:
                                                  '${res.spentAmount} ₽/ ${(context.read<HomeCubit>().calculateProgress((res.spentAmount).toDouble(), (res.goalsAmount).toDouble())).toInt()}%',
                                              left: '',
                                              progress: context
                                                  .read<HomeCubit>()
                                                  .calculateProgress(
                                                      (res.spentAmount)
                                                          .toDouble(),
                                                      (res.goalsAmount)
                                                          .toDouble()));
                                        }),
                                      ),
                                    )
                                  : const SizedBox();
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushRoute(const NewTransactionRoute());
              context.read<TotalCubit>().totalToClean();
              context.read<AddRowCubit>().transToClean();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
