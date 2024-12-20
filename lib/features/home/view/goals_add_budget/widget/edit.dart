import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';

class Edit extends StatefulWidget {
  const Edit({super.key, required this.res});
  final Goals res;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController nameController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.res.nameGoals);
    amountController = TextEditingController(
        text:
            widget.res.goalsAmount.toString()); // Инициализация значением цели
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconData(widget.res.iconCode, fontFamily: 'MaterialIcons'),
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Goal Name',
                    ),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Goal Amount (₽)',
                ),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
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
                        .calculateProgress(
                          widget.res.goalsFilled.toDouble(),
                          double.tryParse(amountController.text) ?? 0.0,
                        )
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Filled ${widget.res.goalsFilled} ₽/ ${(context.read<HomeCubit>().calculateProgress(widget.res.goalsFilled.toDouble(), double.tryParse(amountController.text) ?? 0.0) * 100).toInt()}%'),
                    Text(
                        'Left ${widget.res.spentAmount}₽/ ${(context.read<HomeCubit>().calculateProgress(widget.res.spentAmount.toDouble(), double.tryParse(amountController.text) ?? 0.0) * 100).toInt()}%'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.res.namesTrans.length.toString(),
                    style: const TextStyle(),
                  ),
                ],
              ),
              children: widget.res.amounts.isNotEmpty
                  ? List.generate(
                      widget.res.amounts.length,
                      (index) => ListTile(
                        title: Text(widget.res.namesTrans[index]),
                        subtitle: Text(widget.res.dates[index].toString()),
                        trailing: Text(
                          widget.res.amounts[index].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Операций пока что не было',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                debugPrint(
                    'amountController.text : ${amountController.text} int.tryParse(amountController.text) : ${int.tryParse(amountController.text)}');
                context.read<GoalsAddEditCubit>().saveGoalChanges(
                      context,
                      goal: widget.res,
                      newAmount: int.tryParse(amountController.text) ?? 0,
                      newName: nameController.text,
                    );
              },
              title: const Text('Save', style: TextStyle(color: Colors.green)),
              leading: const Icon(Icons.save, color: Colors.green),
            ),
            const ListTile(
              title: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              leading: Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
