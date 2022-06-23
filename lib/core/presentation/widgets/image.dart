import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_project/core/presentation/presentation.dart';

class UNetworkImage extends StatelessWidget {
  const UNetworkImage(
    this.imageUrl, {
    this.fit,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => const UPreloader(),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }
}
