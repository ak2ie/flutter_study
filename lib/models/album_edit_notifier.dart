import 'dart:async';

import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/screens/album_edit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final albumPageNotifierProvider =
    NotifierProvider.autoDispose<AlbumPageNotifier, Album>(() {
  return AlbumPageNotifier();
});

class AlbumPageNotifier extends AutoDisposeNotifier<Album> {
  @override
  Album build() {
    return const Album();
  }

  void setInitState(Album? album) {
    state = state.copyWith(
        id: album?.id ?? 0,
        title: album?.title ?? "",
        userId: album?.userId ?? 0);
  }

  Album get() {
    return state;
  }
}
