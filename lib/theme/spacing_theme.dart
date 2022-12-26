import 'dart:ui';

import 'package:flutter/material.dart';

/// Contains spacing values that are used throughout the library.
class OneSpacingTheme extends ThemeExtension<OneSpacingTheme> {
  const OneSpacingTheme({
    required this.base,
    double? small,
    double? large,
  })  : small = small ?? base / 2,
        large = large ?? base * 2;

  final double small;
  final double base;
  final double large;

  EdgeInsetsDirectional get smallEdgeInsets => EdgeInsetsDirectional.all(small);
  EdgeInsetsDirectional get edgeInsets => EdgeInsetsDirectional.all(base);
  EdgeInsetsDirectional get largeEdgeInsets => EdgeInsetsDirectional.all(large);

  EdgeInsetsDirectional only({
    bool start = false,
    bool end = false,
    bool top = false,
    bool bottom = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: start ? base : 0,
      end: end ? base : 0,
      top: top ? base : 0,
      bottom: bottom ? base : 0,
    );
  }

  EdgeInsetsDirectional symmetric({
    bool horizontal = false,
    bool vertical = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: horizontal ? base : 0,
      end: horizontal ? base : 0,
      top: vertical ? base : 0,
      bottom: vertical ? base : 0,
    );
  }

  @override
  OneSpacingTheme copyWith({
    double? small,
    double? base,
    double? large,
  }) {
    return OneSpacingTheme(
      small: small ?? this.small,
      base: base ?? this.base,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<OneSpacingTheme> lerp(
    ThemeExtension<OneSpacingTheme>? other,
    double t,
  ) {
    if (other is! OneSpacingTheme) return this;

    return OneSpacingTheme(
      small: lerpDouble(small, other.small, t),
      base: lerpDouble(base, other.base, t) ?? base,
      large: lerpDouble(large, other.large, t),
    );
  }
}

extension OneSpacingThemeExtension on ThemeData {
  OneSpacingTheme get spacing => extension<OneSpacingTheme>()!;
}
