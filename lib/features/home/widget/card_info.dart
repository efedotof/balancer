import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalancerCubit, BalancerState>(
      builder: (context, state) {
        if (state is HomeUpdated) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Номер карты',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        Text(
                          'Нет',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Баланс',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                        Text(
                          '${state.balance}₽',
                          style: const TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Доходы',
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                    Text(
                      '${state.income}₽',
                      maxLines: 2,
                      style: const TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    const Text(
                      'Расходы',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    Text(
                      '${state.expenses}₽',
                      maxLines: 2,
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
