import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  String _formatNumber(double number) {
    final absNumber = number.abs();
    if (absNumber >= 1e18) {
      return '${(number / 1e18).toStringAsFixed(2)} квинт'; // квинтильон
    } else if (absNumber >= 1e15) {
      return '${(number / 1e15).toStringAsFixed(2)} квадр'; // квадриллион
    } else if (absNumber >= 1e12) {
      return '${(number / 1e12).toStringAsFixed(2)} трлн'; // триллион
    } else if (absNumber >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(2)} млрд'; // миллиард
    } else if (absNumber >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(2)} млн'; // миллион
    } else if (absNumber >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(2)} тыс'; // тысяча
    } else {
      return number.toStringAsFixed(2); // обычное число
    }
  }

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
                              '${_formatNumber(state.balance)} ₽',
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
                      'Доход: ${_formatNumber(state.income)} ₽  ', // Пробел после суммы
                      style: const TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    Text(
                      'Расход: ${_formatNumber(state.expenses)} ₽', // Пробел перед текстом
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
