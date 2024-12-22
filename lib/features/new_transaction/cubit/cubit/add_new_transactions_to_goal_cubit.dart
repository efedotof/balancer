import 'package:auto_route/auto_route.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:balancer/router/router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'providers/add_new_goals_provider.dart';

part 'add_new_transactions_to_goal_state.dart';
part 'add_new_transactions_to_goal_cubit.freezed.dart';

class AddNewTransactionsToGoalCubit
    extends Cubit<AddNewTransactionsToGoalState> {
  AddNewTransactionsToGoalCubit()
      : super(const AddNewTransactionsToGoalState.initial());

Future<void> addTransactions(BuildContext context) async {
  try {
    final box = Hive.box<Goals>('goals_box');
    final goals = box.values.toList();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Column(
          children: [
            const SizedBox(height: 16),
            Text(
              S.of(context).myGoals,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: goals.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              S.of(context).noGoalsAvailable,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              context.pushRoute(const GoalSettingsRoute());
                              context.maybePop();
                            },
                            label: Text(S.of(context).AddGoals),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: goals.length,
                      itemBuilder: (BuildContext context, int index) {
                        final goal = goals[index];
                        return ListTile(
                          title: Text(goal.nameGoals),
                          trailing: Icon(
                            IconData(goal.iconCode, fontFamily: 'MaterialIcons'),
                          ),
                          subtitle: Text('${S.of(context).target}: ${goal.goalsAmount}₽'),
                          onTap: () {
                            Navigator.pop(context, goal);
                          },
                        );
                      },
                    ),
            ),
            if (goals.isNotEmpty) 
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton.icon(
                  onPressed: () {
                    context.pushRoute(const GoalSettingsRoute());
                  },
                  label: Text(S.of(context).AddGoals),
                  icon: const Icon(Icons.add),
                ),
              ),
          ],
        );
      },
    ).then((selectedGoal) {
      if (selectedGoal != null && context.mounted) {
        debugPrint('Selected Goal: ${selectedGoal.nameGoals}');
          context
              .read<AddNewGoalsProvider>()
              .goalsToSelecte(select: selectedGoal);
        emit(AddNewTransactionsToGoalState.addNewTransactions(
          iconD: selectedGoal.iconCode,
          name: selectedGoal.nameGoals,
          target: '${S.of(context).target}: ${selectedGoal.goalsAmount}₽'
        ));
      }
    });
  } catch (e) {
    debugPrint('Error: $e');
  }
}



  void cleanToGoals(BuildContext context){
    if(context.mounted){
      context.read<AddNewGoalsProvider>().goalsSelectToClean();
    }

    emit( const AddNewTransactionsToGoalState.initial());
  }




}
