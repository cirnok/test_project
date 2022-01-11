import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class PostPage extends ConsumerWidget {
  const PostPage(
    @PathParam('postId') this.postId, {
    Key? key,
    this.post,
  }) : super(key: key);

  final int postId;
  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postCubitState = ref.watch(postCubitProvider(post ?? postId));

    return UScaffold(
      backgroundColor: Colors.black,
      title: context.localization.post,
      body: UStateDecorator<Post>(
        state: postCubitState,
        builder: (data, _) => _PostContent(data),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          FeatherIcons.messageSquare,
        ),
        onPressed: () async {
          final result = await UDialog.show(
            context,
            CommentFormDialog(
              postId: post?.id ?? postId,
            ),
          );

          if (result != null) {
            ref
                .read(commentListCubitProvider(post?.id ?? postId).notifier)
                .addCommentFromMemory(result);
          }
        },
      ),
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent(
    this.post, {
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return UProvidedStateDecorator<Post>(
      provider: postCubitProvider(post),
      builder: (data, _, __) => Column(
        children: [
          _PostHeader(post),
          const _CommentsListTitle(),
          Expanded(child: _CommentsList(post)),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader(
    this.post, {
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: UCard(
        padding: EdgeInsets.zero,
        borderRadius: DesignConstants.borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UProvidedStateDecorator<User>(
              provider: userCubitProvider(post.userId),
              builder: (data, _, __) => UUserListItem(data),
            ),
            Padding(
              padding: DesignConstants.padding.copyWith(top: 0),
              child: Text(post.body),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentsListTitle extends StatelessWidget {
  const _CommentsListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DesignConstants.padding,
      child: Text(
        context.localization.comments,
        style: context.textTheme.headline6?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _CommentsList extends StatelessWidget {
  const _CommentsList(
    this.post, {
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'postsPage',
      child: UCard(
        padding: EdgeInsets.zero,
        child: UProvidedStateDecorator<List<Comment>>(
          provider: commentListCubitProvider(post.id),
          builder: (data, _, __) => ListView.separated(
            padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
            itemCount: data.length,
            itemBuilder: (_, index) => UCommentListItem(data[index]),
            separatorBuilder: (_, __) => const Divider(),
          ),
        ),
      ),
    );
  }
}
