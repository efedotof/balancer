import 'package:auto_route/auto_route.dart';
import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/generated/l10n.dart';

@RoutePage()
class NewTransactionScreen extends StatelessWidget {
  const NewTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionCategory categorys = TransactionCategory.values.first;
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).newTransaction),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<TotalCubit>()
                  .addBox(context: context, category: categorys);
            },
            child:  Text(S.of(context).save, style: const TextStyle(color: Colors.blue)),
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
                          context
                              .read<TotalCubit>()
                              .updateLeftAndSpent(100); 
                        }
                      },
                      child: Column(
                        children: [
                          Text(
                             category.name(context),
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
       
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     Text(
                      S.of(context).amount,
                      style: const TextStyle(
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

                    if (selectedDate != null && context.mounted) {

                      final selectedTime = await showTimePicker(

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
                  label:  Text(S.of(context).addNewRow),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AddNewTransactionsToGoalCubit,
                    AddNewTransactionsToGoalState>(
                  builder: (context, state) {
                    final state =
                        context.read<AddNewTransactionsToGoalCubit>().state;
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      newTransactionsToEmpty: () => const SizedBox.shrink(),
                      addNewTransactions: (icond, name) => ListTile(
                        title: Text(name),
                        trailing:
                            Icon(IconData(icond, fontFamily: 'MaterialIcons')),
                      ),
                      updateNewTransactions: (icond, name) => ListTile(
                          title: Text(name),
                          trailing: Icon(
                              IconData(icond, fontFamily: 'MaterialIcons'))),
                    );
                  },
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<AddNewTransactionsToGoalCubit>().addTransactions(context);
                  },
                  icon: const Icon(Icons.add),
                  label:  Text(S.of(context).addNewTransactionsToGoals),
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
