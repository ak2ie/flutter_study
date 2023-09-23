import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart'; // dart run build_runner build --delete-conflicting-outputs
part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album(
      {@Default(0) int userId,
      @Default(0) int id,
      @Default('') String title}) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
