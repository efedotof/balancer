// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewTransactionState {
  TransactionCategory get selectedCategory =>
      throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  /// Create a copy of NewTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewTransactionStateCopyWith<NewTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTransactionStateCopyWith<$Res> {
  factory $NewTransactionStateCopyWith(
          NewTransactionState value, $Res Function(NewTransactionState) then) =
      _$NewTransactionStateCopyWithImpl<$Res, NewTransactionState>;
  @useResult
  $Res call({TransactionCategory selectedCategory, DateTime? selectedDate});
}

/// @nodoc
class _$NewTransactionStateCopyWithImpl<$Res, $Val extends NewTransactionState>
    implements $NewTransactionStateCopyWith<$Res> {
  _$NewTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewTransactionStateImplCopyWith<$Res>
    implements $NewTransactionStateCopyWith<$Res> {
  factory _$$NewTransactionStateImplCopyWith(_$NewTransactionStateImpl value,
          $Res Function(_$NewTransactionStateImpl) then) =
      __$$NewTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionCategory selectedCategory, DateTime? selectedDate});
}

/// @nodoc
class __$$NewTransactionStateImplCopyWithImpl<$Res>
    extends _$NewTransactionStateCopyWithImpl<$Res, _$NewTransactionStateImpl>
    implements _$$NewTransactionStateImplCopyWith<$Res> {
  __$$NewTransactionStateImplCopyWithImpl(_$NewTransactionStateImpl _value,
      $Res Function(_$NewTransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCategory = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_$NewTransactionStateImpl(
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$NewTransactionStateImpl implements _NewTransactionState {
  const _$NewTransactionStateImpl(
      {required this.selectedCategory, this.selectedDate});

  @override
  final TransactionCategory selectedCategory;
  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'NewTransactionState(selectedCategory: $selectedCategory, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTransactionStateImpl &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCategory, selectedDate);

  /// Create a copy of NewTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewTransactionStateImplCopyWith<_$NewTransactionStateImpl> get copyWith =>
      __$$NewTransactionStateImplCopyWithImpl<_$NewTransactionStateImpl>(
          this, _$identity);
}

abstract class _NewTransactionState implements NewTransactionState {
  const factory _NewTransactionState(
      {required final TransactionCategory selectedCategory,
      final DateTime? selectedDate}) = _$NewTransactionStateImpl;

  @override
  TransactionCategory get selectedCategory;
  @override
  DateTime? get selectedDate;

  /// Create a copy of NewTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewTransactionStateImplCopyWith<_$NewTransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
