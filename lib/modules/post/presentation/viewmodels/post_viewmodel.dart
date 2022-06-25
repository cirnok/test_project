import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

SingleDataViewModelProvider<Post, PostViewModel> createPostViewModelProvider(
  ModelValue<Post> value,
) {
  return SingleDataViewModelProvider<Post, PostViewModel>(
    (_, sp) => PostViewModel(
      value,
      sp.getRequired<PostRepository>(),
    ),
  );
}

class PostViewModel extends SingleDataViewModel<Post> {
  PostViewModel(
    ModelValue<Post> postValue,
    this._postRepository,
  ) : super(postValue);

  final PostRepository _postRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _postRepository.getPostById(id));
  }
}
