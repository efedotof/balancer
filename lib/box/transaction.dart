import 'package:hive_flutter/hive_flutter.dart';

part 'transaction.g.dart';



@HiveType(typeId: 0)
class Transaction extends HiveObject {

  @HiveField(0)
  String title;


  @HiveField(1)
  String amount;

  @HiveField(2)
  DateTime date;



  Transaction({
    required this.title,
    required this.amount,
    required this.date

  });






}