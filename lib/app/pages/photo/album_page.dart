import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumPage extends StatelessWidget with AutoRouteWrapper {
  const AlbumPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.album,
  }) : super(key: key);

  final int albumId;
  final Album? album;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        AlbumViewModelProvider(
          ModelValue<Album>(id: albumId, cachedModel: album),
        ),
        PhotoListViewModelProvider(albumId),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: context.localization.album,
      body: UWrappedStateDecorator<AlbumViewModel, Album>(
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
    return UWrappedStateDecorator<PhotoListViewModel, List<Photo>>(
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
