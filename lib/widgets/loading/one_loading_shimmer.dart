import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OneLoadingShimmer extends StatelessWidget {
  const OneLoadingShimmer({
    super.key,
    this.padding = const EdgeInsets.all(10),
    this.itemCount = 20,
    this.color,
  });

  final EdgeInsets padding;
  final int itemCount;
  final Color? color;
  Color get _color => color ?? Colors.white70;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: itemCount,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 48, height: 48, color: _color),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: double.infinity, height: 8, color: _color),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Container(width: double.infinity, height: 8, color: _color),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Container(width: 40, height: 8, color: _color),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
