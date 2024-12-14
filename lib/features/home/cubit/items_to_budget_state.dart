part of 'items_to_budget_cubit.dart';

@freezed
class ItemsToBudgetState with _$ItemsToBudgetState {
  const factory ItemsToBudgetState.initial({required TextEditingController controller}) = _Initial;
  const factory ItemsToBudgetState.twoPage() = _TwoPage;
  const factory ItemsToBudgetState.threePage({required double budget, required double selected}) = _ThreePage;

}
