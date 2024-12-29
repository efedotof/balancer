import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/generated/l10n.dart';


class GoalPercentageSlider extends StatelessWidget {
  const GoalPercentageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalAddCubit, GoalAddState>(
      builder: (context, state) {
        if (state.mode == GoalMode.percentage) {
          return Column(
            children: [
              const SizedBox(height: 16),
              Text('${S.of(context).percentage} ${state.percentage?.toInt() ?? 0}%'),
              Slider(
                value: state.percentage ?? 0,
                onChanged: (value) {
                  context.read<GoalAddCubit>().updatePercentage(value);
                  context.read<GoalsProvider>().changePercentage(newPercentage: value);
                },
                min: 0,
                max: 100,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
