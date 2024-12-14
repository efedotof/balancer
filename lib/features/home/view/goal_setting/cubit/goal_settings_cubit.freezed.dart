// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoalSettingsState {
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  GoalMode get mode => throw _privateConstructorUsedError;
  double? get percentage => throw _privateConstructorUsedError;
  int get codes => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  /// Create a copy of GoalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalSettingsStateCopyWith<GoalSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalSettingsStateCopyWith<$Res> {
  factory $GoalSettingsStateCopyWith(
          GoalSettingsState value, $Res Function(GoalSettingsState) then) =
      _$GoalSettingsStateCopyWithImpl<$Res, GoalSettingsState>;
  @useResult
  $Res call(
      {String title,
      double amount,
      IconData icon,
      GoalMode mode,
      double? percentage,
      int codes,
      bool isValid});
}

/// @nodoc
class _$GoalSettingsStateCopyWithImpl<$Res, $Val extends GoalSettingsState>
    implements $GoalSettingsStateCopyWith<$Res> {
  _$GoalSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? icon = null,
    Object? mode = null,
    Object? percentage = freezed,
    Object? codes = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GoalMode,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      codes: null == codes
          ? _value.codes
          : codes // ignore: cast_nullable_to_non_nullable
              as int,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalSettingsStateImplCopyWith<$Res>
    implements $GoalSettingsStateCopyWith<$Res> {
  factory _$$GoalSettingsStateImplCopyWith(_$GoalSettingsStateImpl value,
          $Res Function(_$GoalSettingsStateImpl) then) =
      __$$GoalSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      double amount,
      IconData icon,
      GoalMode mode,
      double? percentage,
      int codes,
      bool isValid});
}

/// @nodoc
class __$$GoalSettingsStateImplCopyWithImpl<$Res>
    extends _$GoalSettingsStateCopyWithImpl<$Res, _$GoalSettingsStateImpl>
    implements _$$GoalSettingsStateImplCopyWith<$Res> {
  __$$GoalSettingsStateImplCopyWithImpl(_$GoalSettingsStateImpl _value,
      $Res Function(_$GoalSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? icon = null,
    Object? mode = null,
    Object? percentage = freezed,
    Object? codes = null,
    Object? isValid = null,
  }) {
    return _then(_$GoalSettingsStateImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GoalMode,
      percentage: freezed == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double?,
      codes: null == codes
          ? _value.codes
          : codes // ignore: cast_nullable_to_non_nullable
              as int,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GoalSettingsStateImpl implements _GoalSettingsState {
  const _$GoalSettingsStateImpl(
      {required this.title,
      required this.amount,
      required this.icon,
      required this.mode,
      required this.percentage,
      required this.codes,
      this.isValid = false});

  @override
  final String title;
  @override
  final double amount;
  @override
  final IconData icon;
  @override
  final GoalMode mode;
  @override
  final double? percentage;
  @override
  final int codes;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'GoalSettingsState(title: $title, amount: $amount, icon: $icon, mode: $mode, percentage: $percentage, codes: $codes, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalSettingsStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.codes, codes) || other.codes == codes) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, amount, icon, mode, percentage, codes, isValid);

  /// Create a copy of GoalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalSettingsStateImplCopyWith<_$GoalSettingsStateImpl> get copyWith =>
      __$$GoalSettingsStateImplCopyWithImpl<_$GoalSettingsStateImpl>(
          this, _$identity);
}

abstract class _GoalSettingsState implements GoalSettingsState {
  const factory _GoalSettingsState(
      {required final String title,
      required final double amount,
      required final IconData icon,
      required final GoalMode mode,
      required final double? percentage,
      required final int codes,
      final bool isValid}) = _$GoalSettingsStateImpl;

  @override
  String get title;
  @override
  double get amount;
  @override
  IconData get icon;
  @override
  GoalMode get mode;
  @override
  double? get percentage;
  @override
  int get codes;
  @override
  bool get isValid;

  /// Create a copy of GoalSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalSettingsStateImplCopyWith<_$GoalSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
