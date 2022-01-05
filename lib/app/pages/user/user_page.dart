import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserPage extends ConsumerWidget {
  const UserPage(
    @PathParam('id') this.userId, {
    Key? key,
    this.user,
  }) : super(key: key);

  final int userId;
  final User? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCubitState = ref.watch(userCubitProvider(user ?? userId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle(context, userCubitState)),
      ),
      body: UStateDecorator<User>(
        state: userCubitState,
        builder: (data, _) => _UserContent(data),
      ),
    );
  }

  String _getTitle(BuildContext context, DataState<User> state) {
    if (state is DataStateLoaded || state is DataStateSlientLoading) {
      final dataState = state as dynamic;
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
