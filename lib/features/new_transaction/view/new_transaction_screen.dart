import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/new_transaction/cubit/add_row_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/new_transaction_cubit.dart';
import 'package:balancer/features/new_transaction/cubit/total_cubit.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NewTransactionScreen extends StatelessWidget {
  const NewTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionCategory categorys = TransactionCategory.values.first;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<TotalCubit>().addBox(context: context, category: categorys);

            },
            child: const Text('Save', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: BlocBuilder<NewTransactionCubit, NewTransactionState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: TransactionCategory.values.map((category) {
                    final isSelected = state.selectedCategory == category;
                    categorys = category;
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<NewTransactionCubit>()
                            .selectCategory(category);

                        if (category == TransactionCategory.income) {
                          context.read<TotalCubit>().updateLeftAndSpent(100); // Пример значения
                        }
                      },
                      child: Column(
                        children: [
                          Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.blue : Colors.grey,
                            ),
                          ),
                          if (isSelected) const SizedBox(height: 4),
                          if (isSelected)
                            Container(
                              height: 2,
                              width: 40,
                              color: Colors.blue,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                // Amount display with TextField for input
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    BlocBuilder<TotalCubit, TotalState>(
                      builder: (context, state) {
                        final state = context.read<TotalCubit>().state;
                        return state.when(
                            initial: () => const Text(
                                  '0 ₽',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                            changeTotal: (total) => Text(
                                  '$total ₽',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Date and account
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(state.selectedDate == null
                      ? 'Today, ${TimeOfDay.now().format(context)}'
                      : '${state.selectedDate!.toLocal()}'),
                  onTap: () async {
                    // Show date picker
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      // Show time picker
                      final selectedTime = await showTimePicker(
                        // ignore: use_build_context_synchronously
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (selectedTime != null) {
                        final dateTime = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute,
                        );
                        if (context.mounted) {
                          context
                              .read<NewTransactionCubit>()
                              .updateSelectedDateTime(dateTime);
                        }
                      }
                    }
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<AddRowCubit, AddRowState>(
                  builder: (context, state) {
                    final state = context.read<AddRowCubit>().state;
                    return state.when(
                      initial: () => const Center(
                        child: Text('Добавьте категорию'),
                      ),
                      addrow: (category) => Wrap(
                        children: List.generate(category.length, (index) {
                          return ListTile(
                            leading: const Icon(Icons.fastfood),
                            title: Text(category[index].categoryTitle),
                            trailing: Text(
                              "${category[index].amount.toInt()} ₽",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onTap: () {},
                          );
                        }),
                      ),
                      updateRow: (category) => Wrap(
                        children: List.generate(category.length, (index) {
                          return ListTile(
                            leading: const Icon(Icons.fastfood),
                            title: Text(category[index].categoryTitle),
                            trailing: Text(
                              "${category[index].amount.toInt()} ₽",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onTap: () {},
                          );
                        }),
                      ),
                    );
                  },
                ),
                TextButton.icon(
                  onPressed: () => context
                      .read<NewTransactionCubit>()
                      .addCategory(context: context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add new row'),
                ),
                const SizedBox(height: 16),
                // Recurring
              ],
            ),
          );
        },
      ),
    );
  }
}
