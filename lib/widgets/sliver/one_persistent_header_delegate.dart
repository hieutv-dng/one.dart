import 'dart:math' as math;
import 'package:flutter/material.dart';

class OnePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  OnePersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    this.color,
  });
  final double minHeight;
  final double maxHeight;
  final Color? color;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: Container(
      color: color,
      child: child,
    ));
  }

  @override
  bool shouldRebuild(OnePersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
