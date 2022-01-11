import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class PhotoListPage extends ConsumerWidget {
  const PhotoListPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.tumbnailPhoto,
    this.initialIndex,
  }) : super(key: key);

  final int albumId;
  final Photo? tumbnailPhoto;
  final int? initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoListCubitState = ref.watch(photoListCubitProvider(albumId));

    return UScaffold(
      backgroundColor: Colors.black,
      title: context.localization.photos,
      body: UStateDecorator<List<Photo>>(
        state: photoListCubitState,
        builder: (data, _) => _PhotoListContent(
          data,
          initialIndex,
        ),
      ),
    );
  }
}

class _PhotoListContent extends ConsumerStatefulWidget {
  const _PhotoListContent(
    this.photos,
    this.initialIndex, {
    Key? key,
  }) : super(key: key);

  final List<Photo> photos;
  final int? initialIndex;

  @override
  ConsumerState<_PhotoListContent> createState() => _PhotoListContentState();
}

class _PhotoListContentState extends ConsumerState<_PhotoListContent> {
  late int index;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    index = widget.initialIndex ?? 0;
    pageController = PageController(initialPage: index);
  }

  void _pageUpdate(int value) {
    setState(() => index = value + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemBuilder: (_, index) => UNetworkImage(widget.photos[index].url),
            itemCount: widget.photos.length,
            onPageChanged: _pageUpdate,
          ),
        ),
        const SizedBox(height: 20),
        UCard(
          child: Text(widget.photos[index].title),
        ),
      ],
    );
  }
}
