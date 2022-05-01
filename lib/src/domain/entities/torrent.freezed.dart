// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'torrent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Torrent _$TorrentFromJson(Map<String, dynamic> json) {
  return _Torrent.fromJson(json);
}

/// @nodoc
mixin _$Torrent {
  String get title => throw _privateConstructorUsedError;
  String get seeds => throw _privateConstructorUsedError;
  String get leechs => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get added => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get magnet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TorrentCopyWith<Torrent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TorrentCopyWith<$Res> {
  factory $TorrentCopyWith(Torrent value, $Res Function(Torrent) then) =
      _$TorrentCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String seeds,
      String leechs,
      String size,
      String added,
      String link,
      String magnet});
}

/// @nodoc
class _$TorrentCopyWithImpl<$Res> implements $TorrentCopyWith<$Res> {
  _$TorrentCopyWithImpl(this._value, this._then);

  final Torrent _value;
  // ignore: unused_field
  final $Res Function(Torrent) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? seeds = freezed,
    Object? leechs = freezed,
    Object? size = freezed,
    Object? added = freezed,
    Object? link = freezed,
    Object? magnet = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      seeds: seeds == freezed
          ? _value.seeds
          : seeds // ignore: cast_nullable_to_non_nullable
              as String,
      leechs: leechs == freezed
          ? _value.leechs
          : leechs // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      added: added == freezed
          ? _value.added
          : added // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      magnet: magnet == freezed
          ? _value.magnet
          : magnet // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TorrentCopyWith<$Res> implements $TorrentCopyWith<$Res> {
  factory _$TorrentCopyWith(_Torrent value, $Res Function(_Torrent) then) =
      __$TorrentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String seeds,
      String leechs,
      String size,
      String added,
      String link,
      String magnet});
}

/// @nodoc
class __$TorrentCopyWithImpl<$Res> extends _$TorrentCopyWithImpl<$Res>
    implements _$TorrentCopyWith<$Res> {
  __$TorrentCopyWithImpl(_Torrent _value, $Res Function(_Torrent) _then)
      : super(_value, (v) => _then(v as _Torrent));

  @override
  _Torrent get _value => super._value as _Torrent;

  @override
  $Res call({
    Object? title = freezed,
    Object? seeds = freezed,
    Object? leechs = freezed,
    Object? size = freezed,
    Object? added = freezed,
    Object? link = freezed,
    Object? magnet = freezed,
  }) {
    return _then(_Torrent(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      seeds: seeds == freezed
          ? _value.seeds
          : seeds // ignore: cast_nullable_to_non_nullable
              as String,
      leechs: leechs == freezed
          ? _value.leechs
          : leechs // ignore: cast_nullable_to_non_nullable
              as String,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      added: added == freezed
          ? _value.added
          : added // ignore: cast_nullable_to_non_nullable
              as String,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      magnet: magnet == freezed
          ? _value.magnet
          : magnet // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Torrent implements _Torrent {
  const _$_Torrent(
      {required this.title,
      required this.seeds,
      required this.leechs,
      required this.size,
      required this.added,
      required this.link,
      required this.magnet});

  factory _$_Torrent.fromJson(Map<String, dynamic> json) =>
      _$$_TorrentFromJson(json);

  @override
  final String title;
  @override
  final String seeds;
  @override
  final String leechs;
  @override
  final String size;
  @override
  final String added;
  @override
  final String link;
  @override
  final String magnet;

  @override
  String toString() {
    return 'Torrent(title: $title, seeds: $seeds, leechs: $leechs, size: $size, added: $added, link: $link, magnet: $magnet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Torrent &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.seeds, seeds) &&
            const DeepCollectionEquality().equals(other.leechs, leechs) &&
            const DeepCollectionEquality().equals(other.size, size) &&
            const DeepCollectionEquality().equals(other.added, added) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality().equals(other.magnet, magnet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(seeds),
      const DeepCollectionEquality().hash(leechs),
      const DeepCollectionEquality().hash(size),
      const DeepCollectionEquality().hash(added),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(magnet));

  @JsonKey(ignore: true)
  @override
  _$TorrentCopyWith<_Torrent> get copyWith =>
      __$TorrentCopyWithImpl<_Torrent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TorrentToJson(this);
  }
}

abstract class _Torrent implements Torrent {
  const factory _Torrent(
      {required final String title,
      required final String seeds,
      required final String leechs,
      required final String size,
      required final String added,
      required final String link,
      required final String magnet}) = _$_Torrent;

  factory _Torrent.fromJson(Map<String, dynamic> json) = _$_Torrent.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get seeds => throw _privateConstructorUsedError;
  @override
  String get leechs => throw _privateConstructorUsedError;
  @override
  String get size => throw _privateConstructorUsedError;
  @override
  String get added => throw _privateConstructorUsedError;
  @override
  String get link => throw _privateConstructorUsedError;
  @override
  String get magnet => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TorrentCopyWith<_Torrent> get copyWith =>
      throw _privateConstructorUsedError;
}
