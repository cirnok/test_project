import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

class PostViewModelProvider extends SPBlocProvider<PostViewModel> {
  PostViewModelProvider(
    ModelValue<Post> postValue, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => PostViewModel(
            sp.getRequired<PostRepository>(),
            postValue,
          ),
        );
}

class PostViewModel extends SingleDataViewModel<Post> {
  PostViewModel(
    this._postRepository,
    ModelValue<Post> postValue,
  ) : super(postValue);

  final PostRepository _postRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _postRepository.getPostById(id));
  }
}
