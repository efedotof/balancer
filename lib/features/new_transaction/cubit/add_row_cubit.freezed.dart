// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_row_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddRowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionItem> transaction) addrow,
    required TResult Function(List<TransactionItem> transaction) updateRow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionItem> transaction)? addrow,
    TResult? Function(List<TransactionItem> transaction)? updateRow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionItem> transaction)? addrow,
    TResult Function(List<TransactionItem> transaction)? updateRow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddRow value) addrow,
    required TResult Function(_UpdateRow value) updateRow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddRow value)? addrow,
    TResult? Function(_UpdateRow value)? updateRow,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddRow value)? addrow,
    TResult Function(_UpdateRow value)? updateRow,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRowStateCopyWith<$Res> {
  factory $AddRowStateCopyWith(
          AddRowState value, $Res Function(AddRowState) then) =
      _$AddRowStateCopyWithImpl<$Res, AddRowState>;
}

/// @nodoc
class _$AddRowStateCopyWithImpl<$Res, $Val extends AddRowState>
    implements $AddRowStateCopyWith<$Res> {
  _$AddRowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddRowStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddRowState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionItem> transaction) addrow,
    required TResult Function(List<TransactionItem> transaction) updateRow,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionItem> transaction)? addrow,
    TResult? Function(List<TransactionItem> transaction)? updateRow,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionItem> transaction)? addrow,
    TResult Function(List<TransactionItem> transaction)? updateRow,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddRow value) addrow,
    required TResult Function(_UpdateRow value) updateRow,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddRow value)? addrow,
    TResult? Function(_UpdateRow value)? updateRow,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddRow value)? addrow,
    TResult Function(_UpdateRow value)? updateRow,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddRowState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddRowImplCopyWith<$Res> {
  factory _$$AddRowImplCopyWith(
          _$AddRowImpl value, $Res Function(_$AddRowImpl) then) =
      __$$AddRowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionItem> transaction});
}

/// @nodoc
class __$$AddRowImplCopyWithImpl<$Res>
    extends _$AddRowStateCopyWithImpl<$Res, _$AddRowImpl>
    implements _$$AddRowImplCopyWith<$Res> {
  __$$AddRowImplCopyWithImpl(
      _$AddRowImpl _value, $Res Function(_$AddRowImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$AddRowImpl(
      transaction: null == transaction
          ? _value._transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ));
  }
}

/// @nodoc

class _$AddRowImpl implements _AddRow {
  const _$AddRowImpl({required final List<TransactionItem> transaction})
      : _transaction = transaction;

  final List<TransactionItem> _transaction;
  @override
  List<TransactionItem> get transaction {
    if (_transaction is EqualUnmodifiableListView) return _transaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transaction);
  }

  @override
  String toString() {
    return 'AddRowState.addrow(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRowImpl &&
            const DeepCollectionEquality()
                .equals(other._transaction, _transaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transaction));

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRowImplCopyWith<_$AddRowImpl> get copyWith =>
      __$$AddRowImplCopyWithImpl<_$AddRowImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionItem> transaction) addrow,
    required TResult Function(List<TransactionItem> transaction) updateRow,
  }) {
    return addrow(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionItem> transaction)? addrow,
    TResult? Function(List<TransactionItem> transaction)? updateRow,
  }) {
    return addrow?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionItem> transaction)? addrow,
    TResult Function(List<TransactionItem> transaction)? updateRow,
    required TResult orElse(),
  }) {
    if (addrow != null) {
      return addrow(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddRow value) addrow,
    required TResult Function(_UpdateRow value) updateRow,
  }) {
    return addrow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddRow value)? addrow,
    TResult? Function(_UpdateRow value)? updateRow,
  }) {
    return addrow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddRow value)? addrow,
    TResult Function(_UpdateRow value)? updateRow,
    required TResult orElse(),
  }) {
    if (addrow != null) {
      return addrow(this);
    }
    return orElse();
  }
}

abstract class _AddRow implements AddRowState {
  const factory _AddRow({required final List<TransactionItem> transaction}) =
      _$AddRowImpl;

  List<TransactionItem> get transaction;

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddRowImplCopyWith<_$AddRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRowImplCopyWith<$Res> {
  factory _$$UpdateRowImplCopyWith(
          _$UpdateRowImpl value, $Res Function(_$UpdateRowImpl) then) =
      __$$UpdateRowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionItem> transaction});
}

/// @nodoc
class __$$UpdateRowImplCopyWithImpl<$Res>
    extends _$AddRowStateCopyWithImpl<$Res, _$UpdateRowImpl>
    implements _$$UpdateRowImplCopyWith<$Res> {
  __$$UpdateRowImplCopyWithImpl(
      _$UpdateRowImpl _value, $Res Function(_$UpdateRowImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$UpdateRowImpl(
      transaction: null == transaction
          ? _value._transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ));
  }
}

/// @nodoc

class _$UpdateRowImpl implements _UpdateRow {
  const _$UpdateRowImpl({required final List<TransactionItem> transaction})
      : _transaction = transaction;

  final List<TransactionItem> _transaction;
  @override
  List<TransactionItem> get transaction {
    if (_transaction is EqualUnmodifiableListView) return _transaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transaction);
  }

  @override
  String toString() {
    return 'AddRowState.updateRow(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRowImpl &&
            const DeepCollectionEquality()
                .equals(other._transaction, _transaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transaction));

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRowImplCopyWith<_$UpdateRowImpl> get copyWith =>
      __$$UpdateRowImplCopyWithImpl<_$UpdateRowImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionItem> transaction) addrow,
    required TResult Function(List<TransactionItem> transaction) updateRow,
  }) {
    return updateRow(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionItem> transaction)? addrow,
    TResult? Function(List<TransactionItem> transaction)? updateRow,
  }) {
    return updateRow?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionItem> transaction)? addrow,
    TResult Function(List<TransactionItem> transaction)? updateRow,
    required TResult orElse(),
  }) {
    if (updateRow != null) {
      return updateRow(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_AddRow value) addrow,
    required TResult Function(_UpdateRow value) updateRow,
  }) {
    return updateRow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_AddRow value)? addrow,
    TResult? Function(_UpdateRow value)? updateRow,
  }) {
    return updateRow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_AddRow value)? addrow,
    TResult Function(_UpdateRow value)? updateRow,
    required TResult orElse(),
  }) {
    if (updateRow != null) {
      return updateRow(this);
    }
    return orElse();
  }
}

abstract class _UpdateRow implements AddRowState {
  const factory _UpdateRow({required final List<TransactionItem> transaction}) =
      _$UpdateRowImpl;

  List<TransactionItem> get transaction;

  /// Create a copy of AddRowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRowImplCopyWith<_$UpdateRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
