import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class PostPage extends StatelessWidget with AutoRouteWrapper {
  const PostPage(
    @PathParam('postId') this.postId, {
    Key? key,
    this.post,
  }) : super(key: key);

  final int postId;
  final Post? post;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        PostViewModelProvider(
          ModelValue(id: postId, cachedModel: post),
        ),
        CommentListViewModelProvider(postId),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      backgroundColor: Colors.black,
      title: context.localization.post,
      body: UWrappedStateDecorator<PostViewModel, Post>(
        builder: (_, data, __) => _PostContent(data),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FeatherIcons.messageSquare),
        onPressed: () async {
          await UDialog.show(
            context,
            CommentFormDialog(
              postId: post?.id ?? postId,
            ),
          ).then((value) {
            if (value == null) return;
            context.read<CommentListViewModel>().addCommentFromMemory(value);
          });
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
    return Column(
      children: [
        _PostHeader(post),
        const _CommentsListTitle(),
        Expanded(child: _CommentsList(post)),
      ],
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
    return UserViewModelProvider(
      ModelValue(id: post.userId),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: UCard(
          padding: EdgeInsets.zero,
          borderRadius: DesignConstants.borderRadius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UWrappedStateDecorator<UserViewModel, User>(
                builder: (_, data, __) => UUserListItem(data),
              ),
              Padding(
                padding: DesignConstants.padding.copyWith(top: 0),
                child: Text(post.body),
              ),
            ],
          ),
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
    return UCard(
      padding: EdgeInsets.zero,
      child: UWrappedStateDecorator<CommentListViewModel, List<Comment>>(
        builder: (_, data, __) => ListView.separated(
          padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
          itemCount: data.length,
          itemBuilder: (_, index) => UCommentListItem(data[index]),
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}
