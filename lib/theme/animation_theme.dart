import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OneAnimationTheme extends ThemeExtension<OneAnimationTheme> {
  const OneAnimationTheme({
    required this.short,
    required this.long,
  });

  final Duration short;
  final Duration long;

  @override
  ThemeExtension<OneAnimationTheme> copyWith({
    Duration? short,
    Duration? long,
  }) {
    return OneAnimationTheme(
      short: short ?? this.short,
      long: long ?? this.long,
    );
  }

  @override
  ThemeExtension<OneAnimationTheme> lerp(
    ThemeExtension<OneAnimationTheme>? other,
    double t,
  ) {
    if (other is! OneAnimationTheme) return this;

    return OneAnimationTheme(
      short: lerpDuration(short, other.short, t),
      long: lerpDuration(long, other.long, t),
    );
  }
}

extension OneAnimationThemeExtension on ThemeData {
  OneAnimationTheme get animation => extension<OneAnimationTheme>()!;
}
