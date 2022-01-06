import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumListPage extends StatelessWidget {
  const AlbumListPage(
    @PathParam('userId') this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget build(BuildContext context) {
    final provider = albumListCubitProvider(userId);
    return UScaffold(
      heroTag: 'albumsPage',
      title: AppLocalizations.of(context).albums,
      body: UProvidedStateDecorator<List<Album>>(
        provider: provider,
        builder: (data, failure, ref) {
          return UPaginateListener(
            onFetchRequest: () => ref.read(provider.notifier).loadMore(),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) => AlbumWidget(data[index]),
              itemCount: data.length,
            ),
          );
        },
      ),
    );
  }
}

class AlbumWidget extends StatelessWidget {
  const AlbumWidget(
    this.album, {
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const UIconBox(FeatherIcons.image),
        title: Text(album.title),
        onTap: () => context.navigateTo(
          AlbumRoute(albumId: album.id, album: album),
        ),
      ),
    );
  }
}
