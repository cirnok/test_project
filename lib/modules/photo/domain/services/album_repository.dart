import 'package:test_project/modules/photo/domain/domain.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<Album>>> getAlbums(
    int userId, {
    Pagination? pagination,
  });
  Future<Either<Failure, Album>> getAlbumById(int id);
}
