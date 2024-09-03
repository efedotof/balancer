import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'filter_chip_widget.dart';

class Filters extends StatelessWidget {
  final List<String> nameChip;

  const Filters({
    super.key,
    required this.nameChip,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final selectedIndex = state is FilterSelected ? state.selectedIndex : 0;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(nameChip.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: FilterChipWidget(
                  label: nameChip[index],
                  isSelected: selectedIndex == index,
                  onSelected: () {
                    context.read<HomeCubit>().selectFilter(index);
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
