import 'package:flutter/material.dart';
import 'package:one/one.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Builds an [AnimatedSwitcher] with some predefined defaults.
class OneAnimatedSwitcher extends StatelessWidget {
  const OneAnimatedSwitcher({
    required this.child,
    this.duration,
    this.reverseDuration,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
    this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder,
  });

  const OneAnimatedSwitcher.sliver({
    required this.child,
    this.duration,
    this.reverseDuration,
  })  : transitionBuilder = SliverAnimatedSwitcher.defaultTransitionBuilder,
        layoutBuilder = SliverAnimatedSwitcher.defaultLayoutBuilder;

  final Widget child;

  /// Defaults to [OneAnimationTheme.short].
  final Duration? duration;

  final Duration? reverseDuration;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final AnimatedSwitcherLayoutBuilder layoutBuilder;

  @override
  Widget build(BuildContext context) {
    final duration = this.duration ?? Theme.of(context).animation.short;

    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
      child: child,
    );
  }
}
