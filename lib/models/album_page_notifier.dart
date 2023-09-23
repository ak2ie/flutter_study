import 'dart:async';

import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/models/album_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final albumProvider = AsyncNotifierProvider<AlbumPageNotifier, List<Album>>(
    AlbumPageNotifier.new);

class AlbumPageNotifier extends AsyncNotifier<List<Album>> {
  Future<List<Album>> _load() async {
    return ref.read(albumRepositoryProvider).fetchAlbum();
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      var list = await ref.read(albumRepositoryProvider).fetchAlbum();
      list.add(const Album(id: 100, userId: 999, title: "test!"));
      return list;
    });
  }

  @override
  FutureOr<List<Album>> build() async {
    return _load();
  }
}
