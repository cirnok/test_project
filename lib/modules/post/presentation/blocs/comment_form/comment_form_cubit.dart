import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/infrastructure/infrastructure.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

final commentFormCubitProvider =
    BlocProvider.family<CommentFormCubit, CommentFormState, int>(
  (ref, postId) {
    return CommentFormCubit(
      ref.read<CommentRepository>(commentRepositoryProvider),
      postId,
    );
  },
);

class CommentFormCubit extends Cubit<CommentFormState> {
  CommentFormCubit(
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
    if (state is CommentFormStateLoading) return Future(() => null);
    emit(
      CommentFormState.loading(
        state.commentEditingController,
        postId: state.postId,
      ),
    );

    final response = await _commentRepository.createComment(
      CreateCommentInput(
        postId: state.postId,
        name: state.commentEditingController.nameController.text,
        email: state.commentEditingController.emailController.text,
        body: state.commentEditingController.textController.text,
      ),
    );

    final newState = response.fold(
      (l) => CommentFormState.error(
        state.commentEditingController,
        postId: state.postId,
        failure: l,
      ),
      (r) => CommentFormState.initial(
        state.commentEditingController..clear(),
        postId: state.postId,
      ),
    );

    emit(newState);
    if (newState is CommentFormStateInitial) {
      return response.getRight().toNullable();
    }
  }
}
