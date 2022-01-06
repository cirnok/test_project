import 'package:test_project/constants.dart';
import 'package:test_project/modules/photo/domain/domain.dart';

part 'photo_rest_client.g.dart';

@RestApi(baseUrl: AppConstants.apiUrl)
abstract class PhotoRestClient {
  factory PhotoRestClient(Dio dio) = _PhotoRestClient;

  @GET('/photos/')
  Future<List<Photo>> getPhotos(
    @Query("albumId") int albumId, {
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @GET('/photos/{id}')
  Future<Photo> getPhotoById(@Path("id") int id);
}
