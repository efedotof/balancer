part of 'budget_cubit.dart';

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState.initial() = _Initial;

  const factory BudgetState.empty() = _EmptyState;

  const factory BudgetState.isNotEmpty(
  {required int budgetAmount ,required int? spent, required int? left}
  ) = _IsNotEmpty;

  const factory BudgetState.updateBudget({required int budgetAmount,
    required int? spent, required int? left
  
  }) = _UpdateBudget;

}
