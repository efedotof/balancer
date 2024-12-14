
import 'package:balancer/features/new_transaction/widget/category.dart';
import 'package:balancer/features/report/cubit/report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key, required this.selectedCategory});

  final TransactionCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: TransactionCategory.values.map((category) {
            final isSelected = selectedCategory == category;
            return GestureDetector(
              onTap: () {
                context.read<ReportCubit>().selectCategory(category);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8 /
                    TransactionCategory.values.length,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue[100] : Colors.transparent,
                  borderRadius: isSelected ? BorderRadius.circular(25) : null,
                ),
                child: Text(
                  context.read<ReportCubit>().getCategoryName(category),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}