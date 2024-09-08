import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/features/report/cubit/switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportSwitch extends StatelessWidget {
  const ReportSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCubit, bool>(
      builder: (context, valueSwitch) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Расходы',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: valueSwitch
                    ? const Color(0xFF656E72)
                    : const Color(0xFFCD7670),
              ),
            ),
            const SizedBox(width: 10),
            Switch(
              value: valueSwitch,
              onChanged: (value) {
                context.read<SwitchCubit>().toggleSwitch(value);
                context.read<ReportCubit>().toggleIncomeExpense(value);
              },
            ),
            const SizedBox(width: 10),
            Text(
              'Доход',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: valueSwitch
                    ? const Color(0xFF469C4C)
                    : const Color(0xFF656E72),
              ),
            ),
          ],
        );
      },
    );
  }
}