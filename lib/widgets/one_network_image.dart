import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:one/widgets/loading/one_shimmer.dart';

class OneNetworkImage extends StatelessWidget {
  const OneNetworkImage({
    required String? imageUrl,
    BoxFit? fit,
    double? height,
    double? width,
    this.imageBuilder,
    this.errorWidget,
    super.key,
  })  : _imageUrl = imageUrl,
        _fit = fit,
        _height = height,
        _width = width;

  final String? _imageUrl;
  final BoxFit? _fit;
  final double? _height;
  final double? _width;
  final Widget Function(BuildContext context, ImageProvider<Object> child)? imageBuilder;
  final Widget Function(BuildContext context, String url, dynamic error)? errorWidget;

  bool get _validURL => _imageUrl?.isEmpty ?? true ? false : Uri.parse(_imageUrl!).isAbsolute;

  @override
  Widget build(BuildContext context) {
    if (!_validURL) return const LacoEmptyImage();

    return CachedNetworkImage(
      imageUrl: _imageUrl!,
      fit: _fit,
      height: _height,
      width: _width,
      imageBuilder: imageBuilder,
      placeholder: (context, url) => OneShimmer(child: Container(color: Colors.white)),
      errorWidget: errorWidget ?? (context, url, error) => const LacoEmptyImage(),
    );
  }
}

class LacoEmptyImage extends StatelessWidget {
  const LacoEmptyImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey,
          ),
          Text('No Image', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
