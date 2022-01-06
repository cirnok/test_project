import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserPage extends ConsumerWidget {
  const UserPage(
    @PathParam('userId') this.userId, {
    Key? key,
    this.user,
  }) : super(key: key);

  final int userId;
  final User? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCubitState = ref.watch(userCubitProvider(user ?? userId));

    return UScaffold(
      backgroundColor: Colors.black,
      title: _getTitle(context, userCubitState),
      body: SingleChildScrollView(
        child: UStateDecorator<User>(
          state: userCubitState,
          builder: (data, _) => _UserContent(data),
        ),
      ),
    );
  }

  String _getTitle(BuildContext context, DataState<User> state) {
    if (state is DataStateLoaded || state is DataStateSlientLoading) {
      final dataState = state as dynamic;
      return "@" + dataState.data.username;
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
    return Column(
      children: [
        _UserHeader(user),
        const SizedBox(height: 15),
        _UserInformation(user),
        const SizedBox(height: 15),
        _UserAlbums(user),
        const SizedBox(height: 15),
        _UserPosts(user),
      ],
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return UBlock(
      color: Colors.black,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const UIconBox(
            FeatherIcons.user,
            color: Colors.white,
            iconColor: Colors.black,
            size: 35,
            padding: EdgeInsets.all(15),
          ),
          const SizedBox(height: 20),
          Text(
            user.name,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'userListPage',
      child: UBlock(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            ListTile(
              leading: const UIconBox(FeatherIcons.mail),
              title: const Text('Email'),
              subtitle: Text(user.email),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.phone),
              title: const Text('Phone'),
              subtitle: Text(user.phone),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.globe),
              title: const Text('Website'),
              subtitle: Text(user.website),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.home),
              title: const Text('Company'),
              subtitle: Text(user.company.name),
            ),
            ListTile(
              leading: const UIconBox(FeatherIcons.mapPin),
              title: const Text('Address'),
              subtitle: Text(user.address.city),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserAlbums extends StatelessWidget {
  const _UserAlbums(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "albumsPage",
      child: UBlock(
        padding: EdgeInsets.zero,
        child: UProvidedStateDecorator<List<Album>>(
          provider: albumListCubitProvider(user.id),
          builder: (data, failure, ref) {
            return Column(
              children: [
                ListTile(
                  title: const Text('Albums'),
                  trailing: const Icon(FeatherIcons.chevronRight),
                  onTap: () =>
                      context.navigateTo(AlbumListRoute(userId: user.id)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) => AlbumWidget(data[index]),
                  itemCount: data.length < 3 ? data.length : 3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _UserPosts extends StatelessWidget {
  const _UserPosts(
    this.user, {
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "postsPage",
      child: UBlock(
        padding: EdgeInsets.zero,
        child: UProvidedStateDecorator(
          provider: albumListCubitProvider(user.id),
          builder: (data, failure, ref) {
            return Column(
              children: [
                ListTile(
                  title: const Text('Posts'),
                  trailing: const Icon(FeatherIcons.chevronRight),
                  onTap: () =>
                      context.navigateTo(AlbumListRoute(userId: user.id)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
