import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserListPage extends StatelessWidget with AutoRouteWrapper {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return UserListViewModelProvider(child: this);
  }

  @override
  Widget build(BuildContext context) {
    return UDataStateViewModelBuilder<UserListViewModel, List<User>>(
      builder: (context, state) {
        return UScaffold(
          title: context.localization.users,
          body: UStateDecorator<List<User>>(
            state: context.read<UserListViewModel>().state,
            builder: (
              data,
              _,
            ) {
              return UPaginateListener(
                onFetchRequest: () =>
                    context.read<UserListViewModel>().loadMore(),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
                  itemBuilder: (_, index) => UUserListItem(data[index]),
                  itemCount: data.length,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
