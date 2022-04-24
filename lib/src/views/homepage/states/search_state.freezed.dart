// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _SearchStateInitial initial() {
    return const _SearchStateInitial();
  }

  _SearchStateLoading loading() {
    return const _SearchStateLoading();
  }

  _SearchStateData data({required Map<SearchProvider, List<Torrent>> data}) {
    return _SearchStateData(
      data: data,
    );
  }

  _SearchStateError error({String? error}) {
    return _SearchStateError(
      error: error,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<SearchProvider, List<Torrent>> data) data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateData value) data,
    required TResult Function(_SearchStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) then) = _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$SearchStateInitialCopyWith<$Res> {
  factory _$SearchStateInitialCopyWith(_SearchStateInitial value, $Res Function(_SearchStateInitial) then) =
      __$SearchStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchStateInitialCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateInitialCopyWith<$Res> {
  __$SearchStateInitialCopyWithImpl(_SearchStateInitial _value, $Res Function(_SearchStateInitial) _then)
      : super(_value, (v) => _then(v as _SearchStateInitial));

  @override
  _SearchStateInitial get _value => super._value as _SearchStateInitial;
}

/// @nodoc

class _$_SearchStateInitial implements _SearchStateInitial {
  const _$_SearchStateInitial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _SearchStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<SearchProvider, List<Torrent>> data) data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
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
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateData value) data,
    required TResult Function(_SearchStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchStateInitial implements SearchState {
  const factory _SearchStateInitial() = _$_SearchStateInitial;
}

/// @nodoc
abstract class _$SearchStateLoadingCopyWith<$Res> {
  factory _$SearchStateLoadingCopyWith(_SearchStateLoading value, $Res Function(_SearchStateLoading) then) =
      __$SearchStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SearchStateLoadingCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateLoadingCopyWith<$Res> {
  __$SearchStateLoadingCopyWithImpl(_SearchStateLoading _value, $Res Function(_SearchStateLoading) _then)
      : super(_value, (v) => _then(v as _SearchStateLoading));

  @override
  _SearchStateLoading get _value => super._value as _SearchStateLoading;
}

/// @nodoc

class _$_SearchStateLoading implements _SearchStateLoading {
  const _$_SearchStateLoading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _SearchStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<SearchProvider, List<Torrent>> data) data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateData value) data,
    required TResult Function(_SearchStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SearchStateLoading implements SearchState {
  const factory _SearchStateLoading() = _$_SearchStateLoading;
}

/// @nodoc
abstract class _$SearchStateDataCopyWith<$Res> {
  factory _$SearchStateDataCopyWith(_SearchStateData value, $Res Function(_SearchStateData) then) =
      __$SearchStateDataCopyWithImpl<$Res>;
  $Res call({Map<SearchProvider, List<Torrent>> data});
}

/// @nodoc
class __$SearchStateDataCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateDataCopyWith<$Res> {
  __$SearchStateDataCopyWithImpl(_SearchStateData _value, $Res Function(_SearchStateData) _then)
      : super(_value, (v) => _then(v as _SearchStateData));

  @override
  _SearchStateData get _value => super._value as _SearchStateData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_SearchStateData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<SearchProvider, List<Torrent>>,
    ));
  }
}

/// @nodoc

class _$_SearchStateData implements _SearchStateData {
  const _$_SearchStateData({required this.data});

  @override
  final Map<SearchProvider, List<Torrent>> data;

  @override
  String toString() {
    return 'SearchState.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchStateData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$SearchStateDataCopyWith<_SearchStateData> get copyWith =>
      __$SearchStateDataCopyWithImpl<_SearchStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<SearchProvider, List<Torrent>> data) data,
    required TResult Function(String? error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateData value) data,
    required TResult Function(_SearchStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _SearchStateData implements SearchState {
  const factory _SearchStateData({required Map<SearchProvider, List<Torrent>> data}) = _$_SearchStateData;

  Map<SearchProvider, List<Torrent>> get data;
  @JsonKey(ignore: true)
  _$SearchStateDataCopyWith<_SearchStateData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchStateErrorCopyWith<$Res> {
  factory _$SearchStateErrorCopyWith(_SearchStateError value, $Res Function(_SearchStateError) then) =
      __$SearchStateErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$SearchStateErrorCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateErrorCopyWith<$Res> {
  __$SearchStateErrorCopyWithImpl(_SearchStateError _value, $Res Function(_SearchStateError) _then)
      : super(_value, (v) => _then(v as _SearchStateError));

  @override
  _SearchStateError get _value => super._value as _SearchStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_SearchStateError(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SearchStateError implements _SearchStateError {
  const _$_SearchStateError({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'SearchState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$SearchStateErrorCopyWith<_SearchStateError> get copyWith =>
      __$SearchStateErrorCopyWithImpl<_SearchStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<SearchProvider, List<Torrent>> data) data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<SearchProvider, List<Torrent>> data)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStateInitial value) initial,
    required TResult Function(_SearchStateLoading value) loading,
    required TResult Function(_SearchStateData value) data,
    required TResult Function(_SearchStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStateInitial value)? initial,
    TResult Function(_SearchStateLoading value)? loading,
    TResult Function(_SearchStateData value)? data,
    TResult Function(_SearchStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SearchStateError implements SearchState {
  const factory _SearchStateError({String? error}) = _$_SearchStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$SearchStateErrorCopyWith<_SearchStateError> get copyWith => throw _privateConstructorUsedError;
}
