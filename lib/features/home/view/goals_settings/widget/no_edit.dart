import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class NoEdit extends StatelessWidget {
  const NoEdit({super.key, required this.res});
  final Goals res;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        res.goalsFilled >= res.goalsAmount
            ? Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Lottie.asset(
                  repeat: false,
                  'assets/animation/confettie.json',
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 15,
                    children: [
                      Icon(
                        IconData(res.iconCode, fontFamily: 'MaterialIcons'),
                        size: 30,
                      ),
                      Text(
                        res.nameGoals,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    "${res.goalsAmount} ₽",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: LinearProgressIndicator(
                        value: context
                            .read<HomeCubit>()
                            .calculateProgress(res.goalsFilled,
                                res.goalsAmount)
                            .clamp(0.0, 1.0),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[200],
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${S.of(context).filled} ${res.goalsFilled.toStringAsFixed(2)} ₽/ ${(context.read<HomeCubit>().calculateProgress(res.goalsFilled.toDouble(), res.goalsAmount) * 100)}%'),
                              const SizedBox(width: 10),
                          Text(
                              '${S.of(context).left} ${res.spentAmount.toStringAsFixed(2)} ₽/ ${(context.read<HomeCubit>().calculateProgress(res.spentAmount.toDouble(), res.goalsAmount) * 100)}%'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                    "${S.of(context).periodicRate}: ${res.percentageOfTheBudget.toString()} %"),
                ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).transactions,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        res.namesTrans.length.toString(),
                        style: const TextStyle(),
                      ),
                    ],
                  ),
                  children: res.amounts.isNotEmpty
                      ? (() {
                          final sortedIndices = List<int>.generate(
                              res.dates.length, (i) => i)
                            ..sort(
                                (a, b) => res.dates[b].compareTo(res.dates[a]));

                          return List.generate(
                            sortedIndices.length,
                            (sortedIndex) {
                              final index = sortedIndices[sortedIndex];
                              return ListTile(
                                title: res.arbDateNameTrans != null
                                    ? Text(name(
                                        context, res.arbDateNameTrans![index]))
                                    : Text(res.namesTrans[index]),
                                subtitle: Text(
                                  context
                                      .read<ReportCubit>()
                                      .formatDate(res.dates[index]),
                                ),
                                trailing: Text(
                                  '${res.incomeOrExpenses != null ? (res.incomeOrExpenses![index] ? res.amounts[index] : -res.amounts[index]) : res.amounts[index]} ₽',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          );
                        })()
                      : [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              S.of(context).thereHaveBeenNoOperationsYet,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Text(
                    S.of(context).settings,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  onTap: () => context
                      .read<GoalsSettingsEditCubit>()
                      .toggleEditMode(isEditing: true),
                  title: Text(S.of(context).edit,
                      style: const TextStyle(color: Colors.green)),
                  leading: const Icon(Icons.edit, color: Colors.green),
                ),
                ListTile(
                  onTap: () => context
                      .read<GoalsSettingsEditCubit>()
                      .deleateToGoals(context, goals: res),
                  title: Text(
                    S.of(context).delete,
                    style: const TextStyle(color: Colors.red),
                  ),
                  leading: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
