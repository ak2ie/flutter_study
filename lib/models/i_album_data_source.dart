import 'album.dart';

/// データソース
abstract class IAlbumDataSource {
	Future<List<Album>> fetchAlbum();
}