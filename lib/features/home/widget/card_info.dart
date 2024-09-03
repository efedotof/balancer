import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
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
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Номер карты',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          Text(
                            'Нет',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Баланс',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              '${context.read<HomeCubit>().formatNumber(state.balance)} ₽',
                              style: const TextStyle(color: Colors.white, fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Доход: ${context.read<HomeCubit>().formatNumber(state.income)} ₽  ', 
                      style: const TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    Text(
                      'Расход: ${context.read<HomeCubit>().formatNumber(state.expenses)} ₽', 
                      style: const TextStyle(color: Colors.red, fontSize: 16),
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
