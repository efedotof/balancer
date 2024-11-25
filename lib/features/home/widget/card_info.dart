import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo(
      {super.key,
      required this.nameCard,
      this.goalAmount,
      required this.leadingWindget,
      this.spent,
      this.left,
      this.progress,
      this.loading,
      this.subtitles,
      this.trailingW, this.onTap});
  final String nameCard;
  final String? goalAmount;
  final Widget? leadingWindget;
  final String? spent;
  final String? left;
  final double? progress;
  final bool? loading;
  final String? subtitles;
  final Widget? trailingW;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
    
      child: (loading != null) && loading!
          ? const ListTile()
          : ListTile(
              onTap: onTap,

              leading: leadingWindget,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(nameCard),
                  goalAmount != null ? Text(goalAmount!) : const Text(''),
                ],
              ),
              trailing: trailingW,
              subtitle: progress != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(16), // Радиус закругления
                          child: LinearProgressIndicator(
                            value: progress!.clamp(0.0,
                                1.0), // Убедитесь, что progress в диапазоне [0, 1]
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue), // Цвет прогресса
                            backgroundColor: Colors.grey[200], // Цвет фона
                            minHeight: 8, // Толщина индикатора
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: (spent != null) && (left != null)
                              ? [Text(spent!), Text(left!)]
                              : [],
                        )
                      ],
                    )
                  : subtitles != '' && subtitles != null
                      ?Text(subtitles!): const Text('Add your saving goals')
                      ,
            ),
    );
  }
}
