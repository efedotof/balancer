part of 'add_row_cubit.dart';

@freezed
class AddRowState with _$AddRowState {
  const factory AddRowState.initial() = _Initial;
  const factory AddRowState.addrow({required List<TransactionCategoryTitle> category, required List<TransactionItem> transaction}) = _AddRow;
  const factory AddRowState.updateRow({required List<TransactionCategoryTitle> category, required List<TransactionItem> transaction}) = _UpdateRow;
}

// required List<TransactionItem> transaction, required List<TransactionCategoryTitle> categorys