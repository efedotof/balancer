part of 'balancer_cubit.dart';

sealed class BalancerState extends Equatable {
  const BalancerState();

  @override
  List<Object> get props => [];
}

final class BalancerInitial extends BalancerState {}

class HomeUpdated extends BalancerState {
  final double balance;
  final double income;
  final double expenses;

  const HomeUpdated({
    required this.balance,
    required this.income,
    required this.expenses,
  });

  @override
  List<Object> get props => [balance, income, expenses];
}