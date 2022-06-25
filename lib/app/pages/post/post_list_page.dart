import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

class PostListPage extends StatelessWidget with AutoRouteWrapper {
  const PostListPage(
    @PathParam('userId') this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return PostListViewModelProvider(
      userId,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: context.localization.posts,
      body: UWrappedStateDecorator<PostListViewModel, List<Post>>(
        builder: (context, data, failure) {
          return UPaginateListener(
            onFetchRequest: () => context.read<PostListViewModel>().loadMore(),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
              itemBuilder: (_, index) => UPostListItem(data[index]),
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}
