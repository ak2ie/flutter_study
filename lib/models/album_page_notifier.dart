import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/models/fetch_album.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'fetch_album.dart';

final albumProvider =
    StateNotifierProvider.autoDispose<AlbumPageNotifier, AlbumState>(
        (ref) => AlbumPageNotifier(ref));

class AlbumPageNotifier extends StateNotifier<AlbumState> {
  AlbumPageNotifier(this.ref) : super(const AlbumState());

  final Ref ref;

  void _load() async {
    // リポジトリから取得
    var repo = await ref.read(albumRepositoryProvider).fetchAlbum();
    state = state.copyWith(list: repo, loading: false);
  }

  void reload() async {
    state = state.copyWith(loading: true);
    _load();
  }
}
