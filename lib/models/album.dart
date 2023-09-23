import 'package:freezed_annotation/freezed_annotation.dart';

import 'fetch_album.dart';

part 'album.freezed.dart';  // dart run build_runner build --delete-conflicting-outputs

@freezed
class AlbumState with _$AlbumState {
  const AlbumState._();

  const factory AlbumState({
    @Default([]) List<Album> list,
    @Default(true) bool loading,
  }) = _AlbumState;
}
