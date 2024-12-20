import 'package:balancer/Theme/providers/export_providers.dart';
import 'package:balancer/box/goals/goals.dart';

class NoEdit extends StatelessWidget {
  const NoEdit({super.key, required this.res});
  final Goals res;

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
            Wrap(
              alignment: WrapAlignment.center, // Центрирование содержимого
              crossAxisAlignment:
                  WrapCrossAlignment.center, // Выравнивание по центру
              spacing: 15, // Отступ между элементами
              children: [
                Icon(
                  IconData(res.iconCode, fontFamily: 'MaterialIcons'),
                  size: 30,
                ),
                Text(
                  res.nameGoals,
                  textAlign: TextAlign.center, // Центрирование текста
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                "${res.goalsAmount} ₽",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                        .calculateProgress(res.goalsFilled.toDouble(),
                            res.goalsAmount.toDouble())
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
                        'Filled ${res.goalsFilled} ₽/ ${(context.read<HomeCubit>().calculateProgress(res.goalsFilled.toDouble(), res.goalsAmount.toDouble()) * 100).toInt()}%'),
                    Text(
                        'Left ${res.spentAmount}₽/ ${(context.read<HomeCubit>().calculateProgress(res.spentAmount.toDouble(), res.goalsAmount.toDouble()) * 100).toInt()}%'),
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
                    res.namesTrans.length.toString(),
                    style: const TextStyle(),
                  ),
                ],
              ),
              children: res.amounts.isNotEmpty
                  ? List.generate(
                      res.amounts.length,
                      (index) => ListTile(
                        title:
                            Text(res.namesTrans[index]), // Название транзакции
                        subtitle: Text(
                            res.dates[index].toString()), // Дата транзакции
                        trailing: Text(
                          res.amounts[index].toString(), // Сумма транзакции
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
              onTap: () => context.read<GoalsAddEditCubit>().toggleEditMode(isEditing: true),
              title: const Text('Edit', style: TextStyle(color: Colors.green)),
              leading: const Icon(Icons.edit, color: Colors.green),
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
