import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/home/cubit/budget_cubit.dart';
import 'package:balancer/features/home/cubit/items_to_budget_cubit.dart';
import 'package:balancer/features/home/provider/budget_provider.dart';
import 'package:balancer/router/router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddBudgetScreen extends StatelessWidget {
  const AddBudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final budgetRepository = BudgetRepository();
    TextEditingController monthlyBudget = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemsToBudgetCubit(
            controller: monthlyBudget,
          ),
        ),
        ChangeNotifierProvider<BudgetProvider>(
          create: (context) => BudgetProvider(),
        ),
      ],
      child: AutoTabsRouter(
        routes: [
          ItemsRoute(
            title: "What's your monthly income?",
            subtitle:
                'Value for the income received in the previous month. You may edit this value',
          ),
          ItemsRoute(
            title: 'How much do you want to spend monthly?',
            subtitle:
                'We sugges that your monthly expenses do not exceed 80% of your income. but you can set your own limits.',
          ),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          final model = Provider.of<BudgetProvider>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Monthly budget'),
              actions: [
              
             context.read<BudgetProvider>().isLast? TextButton(
             isSemanticButton: context.read<BudgetProvider>().isPercentageSelected,
             onPressed: () {
                   if(context.read<BudgetProvider>().isPercentageSelected){
                    if(model.amountBudget > 0){
                
                      context.read<BudgetCubit>().addBudget(
                        amountBudget: model.amountBudget,
                        spent: model.spent,
                        left: model.expenses,
                        expenses: model.expenses);
                        context.maybePop();
                       context.pushRoute( SuccessfullyRoute(subtitle: 'Бюджет добавлен'));
                    }
                   }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Значение должно быть больше нуля!')));
                   }
                
                
              }, child: const Text('OK')): const SizedBox.shrink()
              ],
              leading: IconButton(
                  onPressed: () =>  context.maybePop(),
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            body: child,
            bottomNavigationBar:context.read<BudgetProvider>().isLast? null: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                isSemanticButton: false,
                onPressed: () {
                  if(context.read<BudgetProvider>().isSumm){
                     if (tabsRouter.activeIndex + 1 <= 2) {
                      tabsRouter.setActiveIndex(tabsRouter.activeIndex + 1);
                      final index = tabsRouter.activeIndex + 1;
                      context.read<ItemsToBudgetCubit>().setEmit(context,
                          index: index, controller: monthlyBudget);
                    } 
                  }else{
                    null;
                  }
                 
                },
                style: TextButton.styleFrom(
                  backgroundColor:context.read<BudgetProvider>().isSumm? const Color(0xFF5283FF): Colors.grey,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          );
        },
      ),
    );
  }
}
