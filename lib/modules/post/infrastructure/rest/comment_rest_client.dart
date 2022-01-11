import 'package:test_project/constants.dart';
import 'package:test_project/modules/post/domain/domain.dart';

part 'comment_rest_client.g.dart';

@RestApi(baseUrl: AppConstants.apiUrl)
abstract class CommentRestClient {
  factory CommentRestClient(Dio dio) = _CommentRestClient;

  @GET('/comments/')
  Future<List<Comment>> getComments(
    @Query("postId") int postId, {
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @POST('/comments/')
  Future<Comment> createComment(@Body() CreateCommentInput id);
}
