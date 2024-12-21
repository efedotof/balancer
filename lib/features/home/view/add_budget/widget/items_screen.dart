import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/cubit/items_to_budget_cubit.dart';
import 'package:balancer/features/home/provider/budget_provider.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ItemsScreen extends StatelessWidget {
  const ItemsScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(subtitle),
          BlocBuilder<ItemsToBudgetCubit, ItemsToBudgetState>(
            builder: (context, state) {
              return state.when(
                initial: (controller) => Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextField(
                          controller: controller,
                          onChanged: (value){
                          if(value != ''){
                            context.read<BudgetProvider>().setAmountBudget(amountBudgetw: int.parse(value));
                            context.read<BudgetProvider>().changeIsSumm();

                            controller.text = value;
                          }else{
                            controller.text = '0';
                          }
                           
                          },
                          style: const TextStyle(
                            overflow: TextOverflow.clip,
                            color: Color(0xFF5283FF),
                            fontSize: 33,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(
                              color: Color(0xFF5283FF),
                              fontSize: 33,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        '₽',
                        style: TextStyle(
                          color: Color(0xFF5283FF),
                          fontSize: 33,
                        ),
                      )
                    ],
                  ),
                ),
                // twoPage: () => const Center(
                //   child: Text('TwoPage'),
                // ),
                threePage: (budget, selected) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${((selected / budget) * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5283FF),
                          ),
                        ),
                        Slider(
                          min: 0,
                          max: budget,
                          value: selected,
                          onChanged: (value) {
                          context.read<BudgetProvider>().setExpenses(expensesw: value.toInt());
                            context
                                .read<ItemsToBudgetCubit>()
                                .updateSelectedValue(value);
                            if(value > 0){
                              context.read<BudgetProvider>().changePercantageSelector(value: true);
                          }else{
                             context.read<BudgetProvider>().changePercantageSelector(value: false);
                          }
                          },
                        ),
                        Text(
                          '${S.of(context).selected} ${selected.toStringAsFixed(2)} ₽ ${S.of(context).from} ${budget.toStringAsFixed(2)} ₽',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ]));
  }
}
