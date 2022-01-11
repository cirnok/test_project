import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/infrastructure/infrastructure.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

final postCubitProvider =
    BlocProvider.family<PostCubit, DataState<Post>, dynamic>(
  (ref, post) {
    assert(post is int || post is Post);

    return PostCubit(
      ref.read<PostRepository>(postRepositoryProvider),
      post is Post ? post.id : post,
      post is Post ? post : null,
    );
  },
);

class PostCubit extends Cubit<DataState<Post>> {
  PostCubit(
    this._postRepository,
    int postId, [
    Post? post,
  ]) : super(const DataState.empty()) {
    if (post != null) {
      _fromMemory(post);
    } else {
      _getById(postId);
    }
  }

  final PostRepository _postRepository;

  Future<void> _getById(int id) async {
    return loadData(
      () => _postRepository.getPostById(id),
    );
  }

  Future<void> _fromMemory(Post post) {
    emit(DataState.loaded(data: post));
    return slientLoadData(
      () => _postRepository.getPostById(post.id),
    );
  }
}
