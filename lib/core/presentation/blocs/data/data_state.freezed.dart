// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DataStateTearOff {
  const _$DataStateTearOff();

  DataStateEmpty<T> empty<T>({Failure? failure}) {
    return DataStateEmpty<T>(
      failure: failure,
    );
  }

  DataStateLoaded<T> loaded<T>({required T data, Failure? failure}) {
    return DataStateLoaded<T>(
      data: data,
      failure: failure,
    );
  }

  DataStateLoading<T> loading<T>({T? data}) {
    return DataStateLoading<T>(
      data: data,
    );
  }

  DataStateSlientLoading<T> slientLoading<T>({required T? data}) {
    return DataStateSlientLoading<T>(
      data: data,
    );
  }
}

/// @nodoc
const $DataState = _$DataStateTearOff();

/// @nodoc
mixin _$DataState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? failure) empty,
    required TResult Function(T data, Failure? failure) loaded,
    required TResult Function(T? data) loading,
    required TResult Function(T? data) slientLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateEmpty<T> value) empty,
    required TResult Function(DataStateLoaded<T> value) loaded,
    required TResult Function(DataStateLoading<T> value) loading,
    required TResult Function(DataStateSlientLoading<T> value) slientLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateCopyWith<T, $Res> {
  factory $DataStateCopyWith(
          DataState<T> value, $Res Function(DataState<T>) then) =
      _$DataStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$DataStateCopyWithImpl<T, $Res> implements $DataStateCopyWith<T, $Res> {
  _$DataStateCopyWithImpl(this._value, this._then);

  final DataState<T> _value;
  // ignore: unused_field
  final $Res Function(DataState<T>) _then;
}

/// @nodoc
abstract class $DataStateEmptyCopyWith<T, $Res> {
  factory $DataStateEmptyCopyWith(
          DataStateEmpty<T> value, $Res Function(DataStateEmpty<T>) then) =
      _$DataStateEmptyCopyWithImpl<T, $Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$DataStateEmptyCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements $DataStateEmptyCopyWith<T, $Res> {
  _$DataStateEmptyCopyWithImpl(
      DataStateEmpty<T> _value, $Res Function(DataStateEmpty<T>) _then)
      : super(_value, (v) => _then(v as DataStateEmpty<T>));

  @override
  DataStateEmpty<T> get _value => super._value as DataStateEmpty<T>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(DataStateEmpty<T>(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$DataStateEmpty<T> implements DataStateEmpty<T> {
  const _$DataStateEmpty({this.failure});

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'DataState<$T>.empty(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataStateEmpty<T> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $DataStateEmptyCopyWith<T, DataStateEmpty<T>> get copyWith =>
      _$DataStateEmptyCopyWithImpl<T, DataStateEmpty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? failure) empty,
    required TResult Function(T data, Failure? failure) loaded,
    required TResult Function(T? data) loading,
    required TResult Function(T? data) slientLoading,
  }) {
    return empty(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
  }) {
    return empty?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateEmpty<T> value) empty,
    required TResult Function(DataStateLoaded<T> value) loaded,
    required TResult Function(DataStateLoading<T> value) loading,
    required TResult Function(DataStateSlientLoading<T> value) slientLoading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class DataStateEmpty<T> implements DataState<T> {
  const factory DataStateEmpty({Failure? failure}) = _$DataStateEmpty<T>;

  Failure? get failure;
  @JsonKey(ignore: true)
  $DataStateEmptyCopyWith<T, DataStateEmpty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateLoadedCopyWith<T, $Res> {
  factory $DataStateLoadedCopyWith(
          DataStateLoaded<T> value, $Res Function(DataStateLoaded<T>) then) =
      _$DataStateLoadedCopyWithImpl<T, $Res>;
  $Res call({T data, Failure? failure});
}

/// @nodoc
class _$DataStateLoadedCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements $DataStateLoadedCopyWith<T, $Res> {
  _$DataStateLoadedCopyWithImpl(
      DataStateLoaded<T> _value, $Res Function(DataStateLoaded<T>) _then)
      : super(_value, (v) => _then(v as DataStateLoaded<T>));

  @override
  DataStateLoaded<T> get _value => super._value as DataStateLoaded<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(DataStateLoaded<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$DataStateLoaded<T> implements DataStateLoaded<T> {
  const _$DataStateLoaded({required this.data, this.failure});

  @override
  final T data;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'DataState<$T>.loaded(data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataStateLoaded<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $DataStateLoadedCopyWith<T, DataStateLoaded<T>> get copyWith =>
      _$DataStateLoadedCopyWithImpl<T, DataStateLoaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? failure) empty,
    required TResult Function(T data, Failure? failure) loaded,
    required TResult Function(T? data) loading,
    required TResult Function(T? data) slientLoading,
  }) {
    return loaded(data, failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
  }) {
    return loaded?.call(data, failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateEmpty<T> value) empty,
    required TResult Function(DataStateLoaded<T> value) loaded,
    required TResult Function(DataStateLoading<T> value) loading,
    required TResult Function(DataStateSlientLoading<T> value) slientLoading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DataStateLoaded<T> implements DataState<T> {
  const factory DataStateLoaded({required T data, Failure? failure}) =
      _$DataStateLoaded<T>;

  T get data;
  Failure? get failure;
  @JsonKey(ignore: true)
  $DataStateLoadedCopyWith<T, DataStateLoaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateLoadingCopyWith<T, $Res> {
  factory $DataStateLoadingCopyWith(
          DataStateLoading<T> value, $Res Function(DataStateLoading<T>) then) =
      _$DataStateLoadingCopyWithImpl<T, $Res>;
  $Res call({T? data});
}

/// @nodoc
class _$DataStateLoadingCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements $DataStateLoadingCopyWith<T, $Res> {
  _$DataStateLoadingCopyWithImpl(
      DataStateLoading<T> _value, $Res Function(DataStateLoading<T>) _then)
      : super(_value, (v) => _then(v as DataStateLoading<T>));

  @override
  DataStateLoading<T> get _value => super._value as DataStateLoading<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(DataStateLoading<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$DataStateLoading<T> implements DataStateLoading<T> {
  const _$DataStateLoading({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'DataState<$T>.loading(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataStateLoading<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $DataStateLoadingCopyWith<T, DataStateLoading<T>> get copyWith =>
      _$DataStateLoadingCopyWithImpl<T, DataStateLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? failure) empty,
    required TResult Function(T data, Failure? failure) loaded,
    required TResult Function(T? data) loading,
    required TResult Function(T? data) slientLoading,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateEmpty<T> value) empty,
    required TResult Function(DataStateLoaded<T> value) loaded,
    required TResult Function(DataStateLoading<T> value) loading,
    required TResult Function(DataStateSlientLoading<T> value) slientLoading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DataStateLoading<T> implements DataState<T> {
  const factory DataStateLoading({T? data}) = _$DataStateLoading<T>;

  T? get data;
  @JsonKey(ignore: true)
  $DataStateLoadingCopyWith<T, DataStateLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataStateSlientLoadingCopyWith<T, $Res> {
  factory $DataStateSlientLoadingCopyWith(DataStateSlientLoading<T> value,
          $Res Function(DataStateSlientLoading<T>) then) =
      _$DataStateSlientLoadingCopyWithImpl<T, $Res>;
  $Res call({T? data});
}

/// @nodoc
class _$DataStateSlientLoadingCopyWithImpl<T, $Res>
    extends _$DataStateCopyWithImpl<T, $Res>
    implements $DataStateSlientLoadingCopyWith<T, $Res> {
  _$DataStateSlientLoadingCopyWithImpl(DataStateSlientLoading<T> _value,
      $Res Function(DataStateSlientLoading<T>) _then)
      : super(_value, (v) => _then(v as DataStateSlientLoading<T>));

  @override
  DataStateSlientLoading<T> get _value =>
      super._value as DataStateSlientLoading<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(DataStateSlientLoading<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$DataStateSlientLoading<T> implements DataStateSlientLoading<T> {
  const _$DataStateSlientLoading({required this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'DataState<$T>.slientLoading(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataStateSlientLoading<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $DataStateSlientLoadingCopyWith<T, DataStateSlientLoading<T>> get copyWith =>
      _$DataStateSlientLoadingCopyWithImpl<T, DataStateSlientLoading<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Failure? failure) empty,
    required TResult Function(T data, Failure? failure) loaded,
    required TResult Function(T? data) loading,
    required TResult Function(T? data) slientLoading,
  }) {
    return slientLoading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
  }) {
    return slientLoading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Failure? failure)? empty,
    TResult Function(T data, Failure? failure)? loaded,
    TResult Function(T? data)? loading,
    TResult Function(T? data)? slientLoading,
    required TResult orElse(),
  }) {
    if (slientLoading != null) {
      return slientLoading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DataStateEmpty<T> value) empty,
    required TResult Function(DataStateLoaded<T> value) loaded,
    required TResult Function(DataStateLoading<T> value) loading,
    required TResult Function(DataStateSlientLoading<T> value) slientLoading,
  }) {
    return slientLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
  }) {
    return slientLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DataStateEmpty<T> value)? empty,
    TResult Function(DataStateLoaded<T> value)? loaded,
    TResult Function(DataStateLoading<T> value)? loading,
    TResult Function(DataStateSlientLoading<T> value)? slientLoading,
    required TResult orElse(),
  }) {
    if (slientLoading != null) {
      return slientLoading(this);
    }
    return orElse();
  }
}

abstract class DataStateSlientLoading<T> implements DataState<T> {
  const factory DataStateSlientLoading({required T? data}) =
      _$DataStateSlientLoading<T>;

  T? get data;
  @JsonKey(ignore: true)
  $DataStateSlientLoadingCopyWith<T, DataStateSlientLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
