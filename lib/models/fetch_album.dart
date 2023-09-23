import 'dart:convert';

import 'package:flutter_application_2/models/album_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'i_album_data_source.dart';

// リポジトリにデータソースをDIする
final albumRepositoryProvider =
    Provider((ref) => AlbumRepository(ref.read(dataSourceProvider)));

// DIするデータソースを定義
// main.dartで実際に利用するデータソースを記述
final dataSourceProvider =
    Provider<IAlbumDataSource>((ref) => throw UnimplementedError());

class AlbumRepository {
  AlbumRepository(this._dataSource);  // DI(コンストラクタインジェクション)
  final IAlbumDataSource _dataSource;

  Future<List<Album>> fetchAlbum() async {
    final response = await _dataSource.fetchAlbum();
    return response;
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
