part of 'new_transaction_cubit.dart';

@freezed
class NewTransactionState with _$NewTransactionState {
  const factory NewTransactionState({
    required TransactionCategory selectedCategory,
    DateTime? selectedDate, 
  }) = _NewTransactionState;

  factory NewTransactionState.initial() => const NewTransactionState(
        selectedCategory: TransactionCategory.expenses,
        selectedDate: null, 
      );

  

}

