import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/i_album_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'album.dart';

final stubAlbumDataSouceProvider = Provider<StubAlbumDataSouce>((ref) {
  return StubAlbumDataSouce();
});

/// スタブ データソース
class StubAlbumDataSouce implements IAlbumDataSource {
  @override
  Future<List<Album>> fetchAlbum() async {
    final context = json.decode(await rootBundle.loadString(
        'assets/stub/album_stub.json')); // ファイル利用時はpubspec.yamlに記述が必要
    return [Album.fromJson(context)];
  }
}
