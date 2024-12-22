part of 'add_new_transactions_to_goal_cubit.dart';

@freezed
class AddNewTransactionsToGoalState with _$AddNewTransactionsToGoalState {
  const factory AddNewTransactionsToGoalState.initial() = _Initial;
  const factory AddNewTransactionsToGoalState.newTransactionsToEmpty() = _NewTransactionsToEmpty;
  const factory AddNewTransactionsToGoalState.addNewTransactions({required int iconD, required String name, required String target}) = _AddNewTransactions;
  const factory AddNewTransactionsToGoalState.updateNewTransactions({required int iconD, required String name, required String target}) = _updateNewTransactions;
}
