


import 'package:balancer/features/home/widget/statistics_card.dart';
import 'package:flutter/material.dart';

class StatisticsW extends StatelessWidget {
  const StatisticsW({super.key, required this.income, required this.expense});

  final int income;
  final int expense;


  bool less(int income, int expense){
    if(income > expense){
      return false;
    }
    else{
      return true;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.bar_chart_outlined),
            SizedBox(width: 10,),
            Text('Statistics'),
          ],
        ),
        DropdownButton(items: [
        ], onChanged:(value){})



      ],),
      subtitle:  Column(
        children: [
        const SizedBox(height: 10,),
          Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            StatisticsCard(colorsCard: const Color(0xFFD8BAC6), textCard: 'Expense', balanceCard: '- $expense ₽', buttomColor: const Color(0xFFFFC4DB), less: less(income,expense),),
            StatisticsCard(colorsCard: const Color(0xFFBDC2DC), textCard: 'Income', balanceCard: '$income ₽', buttomColor: const Color(0xFFC4D0FF), less: less(expense, income),),
          
          
          ],),
        ],
      ),
      ),
    );
    
    // child: Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
      // Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      //   Text('Statistics'),

      //   DropdownButton(items: [
      //   ], onChanged:(value){})



      // ],),
    
    // ],),);
  }
}