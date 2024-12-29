import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.nameCard,
    this.goalAmount,
    required this.leadingWindget,
    this.spent,
    this.left,
    this.progress,
    this.loading,
    this.subtitles,
    this.trailingW,
    this.onTap,
  });

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
                  Expanded(
                    child: Text(
                      nameCard,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (goalAmount != null)
                    Text(
                      goalAmount!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold,),
                    ),
                ],
              ),
              trailing: trailingW,
              subtitle: progress != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: LinearProgressIndicator(
                            value: progress!.clamp(0.0, 1.0),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                            backgroundColor: Colors.grey[200],
                            minHeight: 8,
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (spent != null && left != null)
                          SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  spent!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  left!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                  : subtitles != '' && subtitles != null
                      ? Text(
                          subtitles!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      :  Text(S.of(context).addYourSavingGoals),
            ),
    );
  }
}
