import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      heroTag: 'userListPage',
      title: context.localization.users,
      body: UProvidedStateDecorator<List<User>>(
        provider: userListViewModelProvider,
        builder: (context, data, failure) => UPaginateListener(
          onFetchRequest: () => context.read<UserListViewModel>().loadMore(),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
            itemBuilder: (_, index) => UUserListItem(data[index]),
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}
