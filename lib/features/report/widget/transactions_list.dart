import 'package:balancer/box/incomeAndExpense/expense/expense_model.dart';
import 'package:balancer/box/incomeAndExpense/income/income_model.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionsList extends StatelessWidget {
  final TransactionCategory category;

  const TransactionsList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    if (category == TransactionCategory.expenses) {
      return ValueListenableBuilder<Box<Expense>>(
        valueListenable: Hive.box<Expense>('ExpenseModel_box').listenable(),
        builder: (context, Box<Expense> box, _) {
          if (box.values.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).transactions,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: List.generate(
                    box.values.length,
                    (index) {
                      final Expense res = box.getAt(box.values.length - 1 - index)!;
                      return ExpansionTile(
                        title: Text(context.read<ReportCubit>().formatDate(res.time)),
                        children: List.generate(
                          res.names.length,
                          (index) => ListTile(
                           leading:  res.iconD != null? Icon(IconData(res.iconD![index],  fontFamily: 'MaterialIcons')): null,
                            // leading: Icon(IconData(
                            //                     res.iconD != null? res.iconD![index]:  0,
                            //                     fontFamily: 'MaterialIcons')),
                            title: Text("${res.names[index]} "),
                            subtitle:res.subtitle != null? Text(res.subtitle!): null,
                            trailing: Text(
                              '${res.amounts[index]} ₽',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
    } else {
      return ValueListenableBuilder<Box<Income>>(
        valueListenable: Hive.box<Income>('IncomeModel_box').listenable(),
        builder: (context, Box<Income> box, _) {
          if (box.values.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  S.of(context).transactions,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: List.generate(
                    box.values.length,
                    (index) {
                      final Income res = box.getAt(box.values.length - 1 - index)!;
                      return ExpansionTile(
                        title: Text(context.read<ReportCubit>().formatDate(res.time)),
                        children: List.generate(
                          res.names.length,
                          (index) => ListTile(
                           leading:  res.iconD != null? Icon(IconData(res.iconD![index],  fontFamily: 'MaterialIcons')): null,
                            title: Text("${res.names[index]} "),
                           subtitle:res.subtitle != null? Text(res.subtitle!): null,
                            trailing: Text(
                              ' ${res.amounts[index]} ₽',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
    }
  }
}
