import 'package:auto_route/auto_route.dart';
import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';

import '../widget/widget.dart';

@RoutePage()
class GoalsAddBudgetScreen extends StatelessWidget {
  const GoalsAddBudgetScreen({super.key, required this.res});

  final Goals res;

  bool less(int income, int expense) {
    return income <= expense;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
            onPressed: () {
              context.maybePop();
              context.read<GoalsAddEditCubit>().toggleEditMode(isEditing: false);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          BlocBuilder<GoalsAddEditCubit, GoalsAddEditState>(
            builder: (context, state) {
            final state = context.read<GoalsAddEditCubit>().state;
              return state.when(noEdit: () => const SizedBox.shrink(), edit: ()=> TextButton(onPressed: () => context.read<GoalsAddEditCubit>().toggleEditMode(isEditing: false), child: const Text('Close')));
            },
          )
        ],
      ),
      body:  BlocBuilder<GoalsAddEditCubit, GoalsAddEditState>(
        builder: (context, state) {
          final state = context.read<GoalsAddEditCubit>().state;
          return state.when(
              noEdit: () => NoEdit(res: res), edit: () => Edit(res: res));
        },
      ),
    );
  }
}
