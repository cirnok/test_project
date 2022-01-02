import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserPage extends StatelessWidget implements AutoRouteWrapper {
  const UserPage(
    @PathParam('id') this.userId, {
    Key? key,
    this.user,
  }) : super(key: key);

  final int userId;
  final User? user;

  @override
  Widget wrappedRoute(BuildContext context) {
    return Provider(
      create: (context) => UserCubit(
        context.read<UserRepository>(),
        userId,
        user,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, DataState<User>>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_getTitle(context, state)),
          ),
          body: UStateDecorator<User>(
            state: state,
            builder: (data, _) => _UserContent(data),
          ),
        );
      },
    );
  }

  String _getTitle(BuildContext context, DataState<User> state) {
    if (state is DataStateLoaded) {
      final dataState = state as DataStateLoaded<User>;
      return dataState.data.username;
    }

    return AppLocalizations.of(context).profile;
  }
}

class _UserContent extends StatelessWidget {
  const _UserContent(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.username),
    );
  }
}
