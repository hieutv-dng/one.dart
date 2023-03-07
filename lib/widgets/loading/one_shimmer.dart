import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OneShimmer extends StatelessWidget {
  const OneShimmer({
    required this.child,
    this.visible = true,
    super.key,
  });

  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) return child;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      enabled: visible,
      child: IgnorePointer(child: child),
    );
  }
}
