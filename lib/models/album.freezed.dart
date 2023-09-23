// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AlbumState {
  List<Album> get list => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlbumStateCopyWith<AlbumState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumStateCopyWith<$Res> {
  factory $AlbumStateCopyWith(
          AlbumState value, $Res Function(AlbumState) then) =
      _$AlbumStateCopyWithImpl<$Res, AlbumState>;
  @useResult
  $Res call({List<Album> list, bool loading});
}

/// @nodoc
class _$AlbumStateCopyWithImpl<$Res, $Val extends AlbumState>
    implements $AlbumStateCopyWith<$Res> {
  _$AlbumStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumStateCopyWith<$Res>
    implements $AlbumStateCopyWith<$Res> {
  factory _$$_AlbumStateCopyWith(
          _$_AlbumState value, $Res Function(_$_AlbumState) then) =
      __$$_AlbumStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Album> list, bool loading});
}

/// @nodoc
class __$$_AlbumStateCopyWithImpl<$Res>
    extends _$AlbumStateCopyWithImpl<$Res, _$_AlbumState>
    implements _$$_AlbumStateCopyWith<$Res> {
  __$$_AlbumStateCopyWithImpl(
      _$_AlbumState _value, $Res Function(_$_AlbumState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? loading = null,
  }) {
    return _then(_$_AlbumState(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Album>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AlbumState extends _AlbumState {
  const _$_AlbumState({final List<Album> list = const [], this.loading = true})
      : _list = list,
        super._();

  final List<Album> _list;
  @override
  @JsonKey()
  List<Album> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'AlbumState(list: $list, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumState &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumStateCopyWith<_$_AlbumState> get copyWith =>
      __$$_AlbumStateCopyWithImpl<_$_AlbumState>(this, _$identity);
}

abstract class _AlbumState extends AlbumState {
  const factory _AlbumState({final List<Album> list, final bool loading}) =
      _$_AlbumState;
  const _AlbumState._() : super._();

  @override
  List<Album> get list;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumStateCopyWith<_$_AlbumState> get copyWith =>
      throw _privateConstructorUsedError;
}
