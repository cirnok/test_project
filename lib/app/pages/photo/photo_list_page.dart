import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class PhotoPage extends StatelessWidget with AutoRouteWrapper {
  const PhotoPage(
    @PathParam('albumId') this.albumId, {
    Key? key,
    this.tumbnailPhoto,
    this.initialIndex,
  }) : super(key: key);

  final int albumId;
  final Photo? tumbnailPhoto;
  final int? initialIndex;

  @override
  Widget wrappedRoute(BuildContext context) {
    return PhotoListViewModelProvider(
      albumId,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return UScaffold(
      backgroundColor: Colors.black,
      title: context.localization.photo,
      body: UWrappedStateDecorator<PhotoListViewModel, List<Photo>>(
        builder: (_, data, __) => PhotoContent(
          data,
          initialIndex,
        ),
      ),
    );
  }
}

@visibleForTesting
class PhotoContent extends StatefulWidget {
  const PhotoContent(
    this.photos,
    this.initialIndex, {
    Key? key,
  }) : super(key: key);

  final List<Photo> photos;
  final int? initialIndex;

  @override
  State<PhotoContent> createState() => _PhotoContentState();
}

class _PhotoContentState extends State<PhotoContent> {
  late int index;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    index = widget.initialIndex ?? 0;
    pageController = PageController(initialPage: index);
  }

  void _pageUpdate(int value) {
    setState(() => index = value);
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
