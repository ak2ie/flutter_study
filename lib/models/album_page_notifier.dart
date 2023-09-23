import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/models/album_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'album_repository.dart';

final albumProvider =
    StateNotifierProvider.autoDispose<AlbumPageNotifier,
    AsyncValue<List<Album>>>(
        (ref) => AlbumPageNotifier(ref));

class AlbumPageNotifier extends StateNotifier<AsyncValue<List<Album>>> {
  AlbumPageNotifier(this.ref) : super(const AsyncValue.loading()) {
    _load();
  }

  final Ref ref;

  void _load() async {
    state = const AsyncValue.loading();
    // リポジトリから取得
    state = await AsyncValue.guard(() async {
      final data = await ref.read(albumRepositoryProvider).fetchAlbum();
      return data;
    });
  }

  void reload() async {
    _load();
  }
}
