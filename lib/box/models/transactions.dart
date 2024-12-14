
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions.freezed.dart';

@freezed
class Transactions with _$Transactions {
  const factory Transactions({
    required int amount,
    required String nameTrans,
    required DateTime date,
  }) = _Transactions;
}

