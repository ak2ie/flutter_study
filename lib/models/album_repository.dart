import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'album.dart';
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
