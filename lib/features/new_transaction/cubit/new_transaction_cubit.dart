import 'package:balancer/features/new_transaction/cubit/add_row_cubit.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/new_transaction/widget/transaction_item.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_transaction_state.dart';
part 'new_transaction_cubit.freezed.dart';

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit() : super(NewTransactionState.initial());

  void selectCategory(TransactionCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void updateSelectedDateTime(DateTime dateTime) {
    emit(state.copyWith(selectedDate: dateTime));
  }

 void addCategory({required BuildContext context}) async {
  TransactionCategoryTitle selectedCategoryTitle =
      TransactionCategoryTitle.salary;
  TextEditingController amountController = TextEditingController();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).addTransactionCategory,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    S.of(context).selectCategory,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 110,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<TransactionCategoryTitle>(
                          value: selectedCategoryTitle,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem<TransactionCategoryTitle>(
                              enabled: false,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  '${S.of(context).expenses}:',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            ...TransactionCategoryTitle.values
                                .where((category) => !_isIncome(category))
                                .map(
                                  (category) =>
                                      DropdownMenuItem<TransactionCategoryTitle>(
                                    value: category,
                                    child: Text(category.name(context)),
                                  ),
                                ),
                            DropdownMenuItem<TransactionCategoryTitle>(
                              enabled: false,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "${S.of(context).income}:",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            ...TransactionCategoryTitle.values
                                .where((category) => _isIncome(category))
                                .map(
                                  (category) =>
                                      DropdownMenuItem<TransactionCategoryTitle>(
                                    value: category,
                                    child: Text(category.name(context)),
                                  ),
                                ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedCategoryTitle = value;
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: S.of(context).amount,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: OutlinedButton(
                    onPressed: () {
                      final amount = double.tryParse(amountController.text);

                      if (amount == null || amount <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              S.of(context).invalidAmountMustBeGreaterThanZero
                            ),
                          ),
                        );
                        return;
                      }
                      context.read<AddRowCubit>().addRow(
                            category: selectedCategoryTitle,
                            context,
                            transactions: TransactionItem(
                              category: state.selectedCategory,
                              amount: amount,
                              categoryTitle:
                                  selectedCategoryTitle.name(context),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).addCategory),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}



  bool _isIncome(TransactionCategoryTitle category) {
    return [
      TransactionCategoryTitle.salary,
      TransactionCategoryTitle.gift,
      TransactionCategoryTitle.investmentIncome,
      TransactionCategoryTitle.freelance,
      TransactionCategoryTitle.otherIncome,
    ].contains(category);
  }
}
