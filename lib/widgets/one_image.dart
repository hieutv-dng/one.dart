import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:one/one.dart';

/// Builds a network [Image] that uses [NetworkImageWithRetry] to retry loading
/// the image multiple times.
class OneImage extends StatelessWidget {
  const OneImage({
    super.key,
    required String this.imageUrl,
    this.alignment = Alignment.center,
    this.fit,
    this.width,
    this.height,
    this.loadingBuilder = defaultLoadingBuilder,
    this.errorBuilder = defaultErrorBuilder,
  }) : imageProvider = null;

  const OneImage.fromImageProvider({
    super.key,
    required ImageProvider this.imageProvider,
    this.alignment = Alignment.center,
    this.fit,
    this.width,
    this.height,
    this.loadingBuilder = defaultLoadingBuilder,
    this.errorBuilder = defaultErrorBuilder,
  }) : imageUrl = null;

  final String? imageUrl;
  final ImageProvider? imageProvider;
  final AlignmentGeometry alignment;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final WidgetBuilder loadingBuilder;
  final ImageErrorWidgetBuilder errorBuilder;

  static Widget defaultLoadingBuilder(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  static Widget defaultErrorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.cardColor,
      child: FractionallySizedBox(
        widthFactor: .5,
        heightFactor: .5,
        child: FittedBox(
          child: Icon(
            Icons.broken_image_outlined,
            color: theme.iconTheme.color,
          ),
        ),
      ),
    );
  }

  Widget _frameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    if (wasSynchronouslyLoaded) return child;

    return OneAnimatedSwitcher(
      child: frame == null ? loadingBuilder(context) : child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image(
        // fallback to NetworkImage in tests because we can't use mocked http
        // overrides for `NetworkImageWithRetry`
        image: imageProvider ?? (isTest ? NetworkImage(imageUrl!) : NetworkImageWithRetry(imageUrl!)) as ImageProvider,
        errorBuilder: errorBuilder,
        frameBuilder: _frameBuilder,
        alignment: alignment,
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
