import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/home/cubit/budget_cubit.dart';
import 'package:balancer/features/home/cubit/goals_cubit.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:balancer/features/home/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widget/widget.dart';

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
                          empty: () => const CardInfo(
                                nameCard: "Monthly budget",
                                leadingWindget: Icon(Icons.add),
                                subtitles: 'Определите ежемесячный бюджет',
                              ),
                          isNotEmpty: (amount, spent, left) => CardInfo(
                                nameCard: "Monthly budget",
                                goalAmount: amount.toString(),
                                leadingWindget:
                                    const Icon(Icons.monetization_on),
                                spent:
                                    'spent $spent / ${(context.read<HomeCubit>().calculateProgress(spent != null ? spent.toDouble() : 0, amount.toDouble())) * 100}%',
                                left:
                                    'left $left / ${(context.read<HomeCubit>().calculateProgress(left != null ? left.toDouble() : 0, amount.toDouble())) * 100}%',
                                progress: context
                                    .read<HomeCubit>()
                                    .calculateProgress(
                                        spent != null ? spent.toDouble() : 0,
                                        amount.toDouble()),
                              ),
                          updateBudget: (amountBudget, spent, left) => CardInfo(
                                nameCard: "Monthly budget",
                                goalAmount: amountBudget.toString(),
                                leadingWindget:
                                    const Icon(Icons.monetization_on),
                                spent:
                                    'spent $spent / ${(context.read<HomeCubit>().calculateProgress(spent != null ? spent.toDouble() : 0, amountBudget.toDouble())) * 100}%',
                                left:
                                    'left $left / ${(context.read<HomeCubit>().calculateProgress(left != null ? left.toDouble() : 0, amountBudget.toDouble())) * 100}%',
                                progress: context
                                    .read<HomeCubit>()
                                    .calculateProgress(
                                        spent != null ? spent.toDouble() : 0,
                                        amountBudget.toDouble()),
                              ));
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
                            onTap: () => context.read<GoalsCubit>().addBox(title: 'Task1', goalsAmount: 1000),
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
                                              leadingWindget: const Icon(
                                                  Icons.monetization_on),
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
        );
      },
    );
  }
}
