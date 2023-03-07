import 'package:flutter/material.dart';
import 'package:one/widgets/one_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class OnePhotoViewerPage extends StatefulWidget {
  const OnePhotoViewerPage({
    required this.items,
    this.initialIndex = 0,
    this.loadingBuilder,
    this.onTapMore,
  });
  final List<String?> items;
  final int initialIndex;
  final LoadingBuilder? loadingBuilder;
  final void Function(int index)? onTapMore;

  @override
  State<StatefulWidget> createState() {
    return _OnePhotoViewerPageState();
  }
}

class _OnePhotoViewerPageState extends State<OnePhotoViewerPage> {
  late final PageController _pageController;
  final minScale = PhotoViewComputedScale.contained;
  final maxScale = PhotoViewComputedScale.covered * 8;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          if (widget.onTapMore != null)
            IconButton(onPressed: () => widget.onTapMore!(_pageController.page?.toInt() ?? widget.initialIndex), icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: _buildImage,
        itemCount: widget.items.length,
        loadingBuilder: widget.loadingBuilder,
        backgroundDecoration: const BoxDecoration(color: Colors.transparent),
        pageController: _pageController,
        // scrollDirection: widget.scrollDirection,
      ),
    );
  }

// build image with zooming
  PhotoViewGalleryPageOptions _buildImage(BuildContext context, int index) {
    final item = widget.items[index];
    return PhotoViewGalleryPageOptions.customChild(
      child: SizedBox(
        // color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: OneNetworkImage(imageUrl: item),
            ),
          ],
        ),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: minScale,
      maxScale: maxScale,
      heroAttributes: item?.isNotEmpty ?? false ? PhotoViewHeroAttributes(tag: item!) : null,
    );
  }
}
