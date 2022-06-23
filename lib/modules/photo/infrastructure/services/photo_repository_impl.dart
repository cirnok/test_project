import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';

final photoRepositoryProvider = Provider<PhotoRepository>(
  (ref) => PhotoRepositoryImpl(
    PhotoRestClient(ref.read<Dio>(dioProvider)),
  ),
);

class PhotoRepositoryImpl implements PhotoRepository {
  PhotoRepositoryImpl(this._client);
  final PhotoRestClient _client;

  @override
  Future<Either<Failure, List<Photo>>> getPhotos(
    int albumId, {
    Pagination? pagination,
  }) {
    return _client
        .getPhotos(
          albumId,
          start: pagination?.start,
          limit: pagination?.limit,
        )
        .toEntity();
  }

  @override
  Future<Either<Failure, Photo>> getPhotoById(int id) async {
    return _client.getPhotoById(id).toEntity();
  }
}
