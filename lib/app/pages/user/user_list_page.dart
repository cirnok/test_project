import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).users),
      ),
      body: UProvidedStateDecorator<List<User>>(
        provider: userListCubitProvider,
        builder: (data, failure, ref) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => _UserWidget(data[index]),
                  childCount: data.length,
                ),
              ),
              SliverToBoxAdapter(
                child: TextButton(
                  child: const Text('Load more'),
                  onPressed: () =>
                      ref.read(userListCubitProvider.notifier).loadMore(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _UserWidget extends StatelessWidget {
  const _UserWidget(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2)),
      ),
      title: Text(user.name),
      subtitle: Text(user.username),
      onTap: () => context.router.navigate(
        UserRoute(userId: user.id, user: user),
      ),
    );
  }
}
