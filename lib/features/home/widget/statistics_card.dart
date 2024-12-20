import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    required this.colorsCard,
    required this.textCard,
    required this.balanceCard,
    required this.buttomColor,
    required this.less,required this.onTaps,
  });

  final Color? colorsCard;
  final String textCard;
  final String balanceCard;
  final Color? buttomColor;
  final bool less;
  final Function()? onTaps;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 160,
      height: less ? 120 : 100,
      duration: const Duration(microseconds: 500),
      child: Card(
        color: colorsCard,
        child: ListTile(
          title: Text(textCard),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  balanceCard,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  overflow: TextOverflow.ellipsis, // Добавить для обрезки текста
                ),
              ),
              // Иконка в контейнере
              GestureDetector(
              onTap: onTaps,
                child: Container(
                  width: 35,
                  height: 35,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: buttomColor,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}