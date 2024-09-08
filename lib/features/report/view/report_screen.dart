import 'package:auto_route/auto_route.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:balancer/features/report/cubit/switch_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/widget.dart';

@RoutePage()
class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
        title: const Text('Отчет', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ReportSwitch(),
            ),
            Expanded(
              child: BlocListener<SwitchCubit, bool>(
                listener: (context, valueSwitch) {
                  context.read<ReportCubit>().toggleIncomeExpense(valueSwitch);
                },
                child: Column(
                  children: [
                    const ReportPieChart(),
                    BlocBuilder<ReportCubit, ReportState>(
                      builder: (context, state) {
                        if (state is ReportUpdated) {
                          return TransactionList(transactions: state.transactions);
                        }
                        return Container(); 
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}