import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumListPage extends StatelessWidget with AutoRouteWrapper {
  const AlbumListPage(
    @PathParam('userId') this.userId, {
    Key? key,
  }) : super(key: key);

  final int userId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return AlbumListViewModelProvider(
      userId,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      title: context.localization.albums,
      body: UWrappedStateDecorator<AlbumListViewModel, List<Album>>(
        builder: (_, data, failure) {
          return UPaginateListener(
            onFetchRequest: () => context.read<AlbumListViewModel>().loadMore(),
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
