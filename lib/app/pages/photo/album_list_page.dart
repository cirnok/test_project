import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class AlbumListPage extends StatelessWidget {
  const AlbumListPage(
    @PathParam('userId') this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    final provider = createAlbumListViewModelProvider(userId);

    return UScaffold(
      heroTag: 'albumsPage',
      title: context.localization.albums,
      body: UProvidedStateDecorator<List<Album>>(
        provider: provider,
        builder: (context, data, failure) {
          return UPaginateListener(
            onFetchRequest: () => context.read<UserListViewModel>().loadMore(),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: context.viewPadding.bottom),
              itemBuilder: (_, index) => UAlbumListItem(data[index]),
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}
