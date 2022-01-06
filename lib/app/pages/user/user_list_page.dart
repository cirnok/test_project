import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      heroTag: 'userListPage',
      title: AppLocalizations.of(context).users,
      body: UProvidedStateDecorator<List<User>>(
        provider: userListCubitProvider,
        builder: (data, failure, ref) => UPaginateListener(
          onFetchRequest: () =>
              ref.read(userListCubitProvider.notifier).loadMore(),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) => _UserWidget(data[index]),
            itemCount: data.length,
          ),
        ),
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
      leading: const UIconBox(FeatherIcons.user),
      title: Text(user.name),
      subtitle: Text("@" + user.username),
      onTap: () => context.navigateTo(
        UserRoute(userId: user.id, user: user),
      ),
    );
  }
}
