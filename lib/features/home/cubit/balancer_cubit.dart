
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'balancer_state.dart';

class BalancerCubit extends Cubit<BalancerState> {
  BalancerCubit() :  super(BalancerInitial()){
    getCard();
  }


  double income = 0;
  double expenses = 0;
  double balance = 0;

  void getCard() async {
    emit(HomeUpdated(balance: balance, income: income, expenses: expenses));
  }

  Future<void> updateBalance(double num, {required bool isIncome}) async {
    balance += isIncome ? num : -num;
    isIncome ? income += num : expenses += num;
    emit(HomeUpdated(balance: balance, income: income, expenses: expenses)); 
  }

  void resetBalance() {
    balance = 0;
    income = 0;
    expenses = 0;
    emit(HomeUpdated(balance: balance, income: income, expenses: expenses)); 
  }

}
