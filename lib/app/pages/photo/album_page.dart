import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumPage extends ConsumerWidget {
  const AlbumPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.album,
  }) : super(key: key);

  final int albumId;
  final Album? album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumCubitState = ref.watch(albumCubitProvider(album ?? albumId));

    return UScaffold(
      heroTag: 'albumsPage',
      title: AppLocalizations.of(context).album,
      body: UStateDecorator<Album>(
        state: albumCubitState,
        builder: (data, _) => _AlbumContent(data),
      ),
    );
  }
}

class _AlbumContent extends ConsumerWidget {
  const _AlbumContent(
    this.album, {
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return UStateDecorator<List<Photo>>(
      state: ref.watch(photoListCubitProvider(album.id)),
      builder: (data, _) => GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            color: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              data[index].thumbnailUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
