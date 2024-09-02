part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}


class AddNewBox extends HomeState {}

class FilterSelected extends HomeState {
  final int selectedIndex;

  const FilterSelected({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}

class TransactionsFiltered extends HomeState {
  final List<Transaction> transactions;

  const TransactionsFiltered({required this.transactions});

  @override
  List<Object> get props => [transactions];
}

