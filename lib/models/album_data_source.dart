import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/album_repository.dart';
import 'package:flutter_application_2/models/i_album_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'album.dart';

final albumDataSouceProvider = Provider<AlbumDataSouce>((ref) {
  final client = http.Client();
  return AlbumDataSouce(client);
});

/// 本物データソース
class AlbumDataSouce implements IAlbumDataSource {
  final http.Client client;

  AlbumDataSouce(this.client);

  @override
  Future<List<Album>> fetchAlbum() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      return List<Album>.from(l.map((m) => Album.fromJson(m)));
    } else {
      throw Exception('Failed to get album.');
    }
  }
}
