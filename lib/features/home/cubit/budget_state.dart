part of 'budget_cubit.dart';

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState.initial() = _Initial;

  const factory BudgetState.empty() = _EmptyState;

  const factory BudgetState.isNotEmpty(
  {required double budgetAmount ,required double spent, required double left}
  ) = _IsNotEmpty;

  const factory BudgetState.updateBudget({required double budgetAmount,
    required double spent, required double left
  
  }) = _UpdateBudget;

}
