import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/album.dart';
import 'package:flutter_application_2/models/album_data_source.dart';
import 'package:flutter_application_2/models/stub_album_data_source.dart';
import 'package:flutter_application_2/models/album_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:collection/collection.dart';
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

// これはユースケースのテストなので、リポジトリはスタブでOK

@GenerateNiceMocks(
    [MockSpec<http.Client>()]) // モック生成コマンド：dart run  build_runner build
void main() async {
  // https://stackoverflow.com/questions/57689492/flutter-unhandled-exception-servicesbinding-defaultbinarymessenger-was-accesse
  WidgetsFlutterBinding.ensureInitialized();

  // テストではモックからデータを取得
  // final container = ProviderContainer(overrides: [
  //   dataSourceProvider
  //       .overrideWith((ref) => ref.watch(stubAlbumDataSouceProvider))
  // ]);

  group('fetchAlbum', () {
    late final AlbumRepository albumRepository;
    // final client = MockClient();

    setUpAll(() => {albumRepository = AlbumRepository(StubAlbumDataSouce())});

    test('returns an Album if the http call completes successfully', () async {
      // final result = await container.read(albumRepositoryProvider).fetchAlbum();
      // final result =
      //     await container.read(stubAlbumDataSouceProvider).fetchAlbum();
      final result = await albumRepository.fetchAlbum();

      final expected = [const Album(userId: 1, id: 2, title: "mock!")];
      final bool equal = const DeepCollectionEquality.unordered()
          .equals(result, expected); //TODO: リストは一致しているのに、trueにならない！

      // デバッグ用
      print("result: ${result.length}, expected: ${expected.length}");
      printAlbum(result[0]);
      printAlbum(expected[0]);

      // ここで失敗すると以降が実行されないので、デバッグ表示は上に書く
      expect(result[0].id, expected[0].id);
      expect(result[0].userId, expected[0].userId);
      expect(result[0].title, expected[0].title);
    });
  });
}

void printAlbum(Album album) {
  print("id: ${album.id}, userId: ${album.userId}, title: ${album.title}");
}
