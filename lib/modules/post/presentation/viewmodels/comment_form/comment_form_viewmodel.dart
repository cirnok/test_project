import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

class CommentFormViewModelProvider
    extends SPBlocProvider<CommentFormViewModel> {
  CommentFormViewModelProvider(
    int postId, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => CommentFormViewModel(
            sp.getRequired<CommentRepository>(),
            postId,
          ),
        );
}

class CommentFormViewModel extends Cubit<CommentFormState> {
  CommentFormViewModel(
    this._commentRepository,
    int postId,
  ) : super(
          CommentFormState.initial(
            CommentEditingController(),
            postId: postId,
          ),
        );

  final CommentRepository _commentRepository;

  Future<Comment?> sendComment() async {
    assert(state is! CommentFormStateLoading);
    emit(CommentFormState.loading(
      state.commentEditingController,
      postId: state.postId,
    ));

    final response = await _commentRepository.createComment(
      CreateCommentInput(
        postId: state.postId,
        name: state.commentEditingController.nameController.text,
        email: state.commentEditingController.emailController.text,
        body: state.commentEditingController.textController.text,
      ),
    );

    emit(response.fold(
      (l) => CommentFormState.error(
        state.commentEditingController,
        postId: state.postId,
        failure: l,
      ),
      (r) => CommentFormState.initial(
        state.commentEditingController..clear(),
        postId: state.postId,
      ),
    ));

    if (state is CommentFormStateInitial) {
      return response.getRight().toNullable();
    }

    return null;
  }
}
