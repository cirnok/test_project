import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.album,
  }) : super(key: key);

  final int? albumId;
  final Album? album;

  @override
  Widget build(BuildContext context) {
    final provider = createAlbumViewModelProvider(
      ModelValue(id: albumId, cachedModel: album),
    );

    return UScaffold(
      heroTag: 'albumsPage',
      title: context.localization.album,
      body: UProvidedStateDecorator<Album>(
        provider: provider,
        builder: (_, data, __) => _AlbumContent(data),
      ),
    );
  }
}

class _AlbumContent extends StatelessWidget {
  const _AlbumContent(
    this.album, {
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return UProvidedStateDecorator<List<Photo>>(
      provider: createPhotoListViewModelProvider(album.id),
      builder: (_, data, __) => GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (_, index) => UPhotoListItem(
          data[index],
          index: index,
        ),
        itemCount: data.length,
      ),
    );
  }
}
