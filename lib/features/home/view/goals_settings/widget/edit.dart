import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/generated/l10n.dart';

class Edit extends StatefulWidget {
  const Edit({super.key, required this.res});
  final Goals res;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController nameController;
  late TextEditingController amountController;
  double periodicalRate = 0.0;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.res.nameGoals);
    amountController =
        TextEditingController(text: widget.res.goalsAmount.toString());
    periodicalRate = widget.res.percentageOfTheBudget != null
        ? widget.res.percentageOfTheBudget!.toDouble()
        : 0.0;
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(widget.res.iconCode, fontFamily: 'MaterialIcons'),
                  size: 30,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: S.of(context).goalName,
                    ),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: S.of(context).goalAmount,
                ),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: LinearProgressIndicator(
                    value: homeCubit
                        .calculateProgress(
                          widget.res.goalsFilled.toDouble(),
                          double.tryParse(amountController.text) ??
                              widget.res.goalsAmount.toDouble(),
                        )
                        .clamp(0.0, 1.0),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                    backgroundColor: Colors.grey[200],
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${S.of(context).periodicRate}: ${periodicalRate.toStringAsFixed(0)}%',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: periodicalRate,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: '${periodicalRate.toStringAsFixed(0)}%',
                  onChanged: (double value) {
                    setState(() {
                      periodicalRate = value;
                    });
                  },
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).filled} ${widget.res.goalsFilled.toStringAsFixed(2)} ₽ / ${(homeCubit.calculateProgress(widget.res.goalsFilled.toDouble(), double.tryParse(amountController.text) ?? widget.res.goalsAmount.toDouble()) * 100).toInt()}%',
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        '${S.of(context).left} ${widget.res.spentAmount.toStringAsFixed(2)} ₽ / ${(homeCubit.calculateProgress(widget.res.spentAmount.toDouble(), double.tryParse(amountController.text) ?? widget.res.goalsAmount.toDouble()) * 100).toInt()}%',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).transactions,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.res.namesTrans.length.toString()),
                ],
              ),
              children: widget.res.amounts.isNotEmpty
                  ? (() {
                      final sortedIndices = List<int>.generate(
                          widget.res.dates.length, (i) => i)
                        ..sort((a, b) =>
                            widget.res.dates[b].compareTo(widget.res.dates[a]));

                      return List.generate(
                        sortedIndices.length,
                        (sortedIndex) {
                          final index = sortedIndices[sortedIndex];
                          return ListTile(
                            title: widget.res.arbDateNameTrans != null
                                ? Text(name(context,
                                    widget.res.arbDateNameTrans![index]))
                                : Text(widget.res.namesTrans[index]),
                            subtitle: Text(
                              context
                                  .read<ReportCubit>()
                                  .formatDate(widget.res.dates[index]),
                            ),
                            trailing: Text(
                              '${widget.res.incomeOrExpenses != null ? (widget.res.incomeOrExpenses![index] ? widget.res.amounts[index] : -widget.res.amounts[index]) : widget.res.amounts[index]} ₽',
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
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Text(
                S.of(context).settings,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                final newAmount = double.tryParse(amountController.text) ??
                    widget.res.goalsAmount;
                context.read<GoalsSettingsEditCubit>().saveGoalChanges(
                      context,
                      goal: widget.res,
                      newAmount: newAmount,
                      newName: nameController.text,
                      newPercentage: periodicalRate,
                    );
              },
              title: Text(
                S.of(context).save,
                style: const TextStyle(color: Colors.green),
              ),
              leading: const Icon(Icons.save, color: Colors.green),
            ),
            ListTile(
              onTap: () => context
                  .read<GoalsSettingsEditCubit>()
                  .deleateToGoals(context, goals: widget.res),
              title: Text(
                S.of(context).delete,
                style: const TextStyle(color: Colors.red),
              ),
              leading: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
