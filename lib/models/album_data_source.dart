import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_application_2/models/fetch_album.dart';
import 'package:flutter_application_2/models/i_album_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

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
      return [Album.fromJson(jsonDecode(response.body))];
    } else {
      throw Exception('Failed to get album.');
    }
  }
}
