// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items_to_budget_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ItemsToBudgetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController controller) initial,
    required TResult Function() twoPage,
    required TResult Function(double budget, double selected) threePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextEditingController controller)? initial,
    TResult? Function()? twoPage,
    TResult? Function(double budget, double selected)? threePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController controller)? initial,
    TResult Function()? twoPage,
    TResult Function(double budget, double selected)? threePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TwoPage value) twoPage,
    required TResult Function(_ThreePage value) threePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TwoPage value)? twoPage,
    TResult? Function(_ThreePage value)? threePage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TwoPage value)? twoPage,
    TResult Function(_ThreePage value)? threePage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsToBudgetStateCopyWith<$Res> {
  factory $ItemsToBudgetStateCopyWith(
          ItemsToBudgetState value, $Res Function(ItemsToBudgetState) then) =
      _$ItemsToBudgetStateCopyWithImpl<$Res, ItemsToBudgetState>;
}

/// @nodoc
class _$ItemsToBudgetStateCopyWithImpl<$Res, $Val extends ItemsToBudgetState>
    implements $ItemsToBudgetStateCopyWith<$Res> {
  _$ItemsToBudgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TextEditingController controller});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ItemsToBudgetStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$InitialImpl(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.controller});

  @override
  final TextEditingController controller;

  @override
  String toString() {
    return 'ItemsToBudgetState.initial(controller: $controller)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController controller) initial,
    required TResult Function() twoPage,
    required TResult Function(double budget, double selected) threePage,
  }) {
    return initial(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextEditingController controller)? initial,
    TResult? Function()? twoPage,
    TResult? Function(double budget, double selected)? threePage,
  }) {
    return initial?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController controller)? initial,
    TResult Function()? twoPage,
    TResult Function(double budget, double selected)? threePage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TwoPage value) twoPage,
    required TResult Function(_ThreePage value) threePage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TwoPage value)? twoPage,
    TResult? Function(_ThreePage value)? threePage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TwoPage value)? twoPage,
    TResult Function(_ThreePage value)? threePage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ItemsToBudgetState {
  const factory _Initial({required final TextEditingController controller}) =
      _$InitialImpl;

  TextEditingController get controller;

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TwoPageImplCopyWith<$Res> {
  factory _$$TwoPageImplCopyWith(
          _$TwoPageImpl value, $Res Function(_$TwoPageImpl) then) =
      __$$TwoPageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TwoPageImplCopyWithImpl<$Res>
    extends _$ItemsToBudgetStateCopyWithImpl<$Res, _$TwoPageImpl>
    implements _$$TwoPageImplCopyWith<$Res> {
  __$$TwoPageImplCopyWithImpl(
      _$TwoPageImpl _value, $Res Function(_$TwoPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TwoPageImpl implements _TwoPage {
  const _$TwoPageImpl();

  @override
  String toString() {
    return 'ItemsToBudgetState.twoPage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TwoPageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController controller) initial,
    required TResult Function() twoPage,
    required TResult Function(double budget, double selected) threePage,
  }) {
    return twoPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextEditingController controller)? initial,
    TResult? Function()? twoPage,
    TResult? Function(double budget, double selected)? threePage,
  }) {
    return twoPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController controller)? initial,
    TResult Function()? twoPage,
    TResult Function(double budget, double selected)? threePage,
    required TResult orElse(),
  }) {
    if (twoPage != null) {
      return twoPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TwoPage value) twoPage,
    required TResult Function(_ThreePage value) threePage,
  }) {
    return twoPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TwoPage value)? twoPage,
    TResult? Function(_ThreePage value)? threePage,
  }) {
    return twoPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TwoPage value)? twoPage,
    TResult Function(_ThreePage value)? threePage,
    required TResult orElse(),
  }) {
    if (twoPage != null) {
      return twoPage(this);
    }
    return orElse();
  }
}

abstract class _TwoPage implements ItemsToBudgetState {
  const factory _TwoPage() = _$TwoPageImpl;
}

/// @nodoc
abstract class _$$ThreePageImplCopyWith<$Res> {
  factory _$$ThreePageImplCopyWith(
          _$ThreePageImpl value, $Res Function(_$ThreePageImpl) then) =
      __$$ThreePageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double budget, double selected});
}

/// @nodoc
class __$$ThreePageImplCopyWithImpl<$Res>
    extends _$ItemsToBudgetStateCopyWithImpl<$Res, _$ThreePageImpl>
    implements _$$ThreePageImplCopyWith<$Res> {
  __$$ThreePageImplCopyWithImpl(
      _$ThreePageImpl _value, $Res Function(_$ThreePageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = null,
    Object? selected = null,
  }) {
    return _then(_$ThreePageImpl(
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ThreePageImpl implements _ThreePage {
  const _$ThreePageImpl({required this.budget, required this.selected});

  @override
  final double budget;
  @override
  final double selected;

  @override
  String toString() {
    return 'ItemsToBudgetState.threePage(budget: $budget, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreePageImpl &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget, selected);

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreePageImplCopyWith<_$ThreePageImpl> get copyWith =>
      __$$ThreePageImplCopyWithImpl<_$ThreePageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TextEditingController controller) initial,
    required TResult Function() twoPage,
    required TResult Function(double budget, double selected) threePage,
  }) {
    return threePage(budget, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TextEditingController controller)? initial,
    TResult? Function()? twoPage,
    TResult? Function(double budget, double selected)? threePage,
  }) {
    return threePage?.call(budget, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TextEditingController controller)? initial,
    TResult Function()? twoPage,
    TResult Function(double budget, double selected)? threePage,
    required TResult orElse(),
  }) {
    if (threePage != null) {
      return threePage(budget, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_TwoPage value) twoPage,
    required TResult Function(_ThreePage value) threePage,
  }) {
    return threePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_TwoPage value)? twoPage,
    TResult? Function(_ThreePage value)? threePage,
  }) {
    return threePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_TwoPage value)? twoPage,
    TResult Function(_ThreePage value)? threePage,
    required TResult orElse(),
  }) {
    if (threePage != null) {
      return threePage(this);
    }
    return orElse();
  }
}

abstract class _ThreePage implements ItemsToBudgetState {
  const factory _ThreePage(
      {required final double budget,
      required final double selected}) = _$ThreePageImpl;

  double get budget;
  double get selected;

  /// Create a copy of ItemsToBudgetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreePageImplCopyWith<_$ThreePageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
