import 'package:flutter/material.dart';

class OneShapeTheme extends ThemeExtension<OneShapeTheme> {
  OneShapeTheme({
    required this.radius,
    BorderRadius? borderRadius,
    ShapeBorder? shape,
  })  : borderRadius = borderRadius ?? BorderRadius.all(radius),
        shape = shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(radius),
            );

  final Radius radius;
  final BorderRadius borderRadius;
  final ShapeBorder shape;

  @override
  OneShapeTheme copyWith({
    Radius? radius,
    BorderRadius? borderRadius,
    ShapeBorder? shape,
  }) {
    return OneShapeTheme(
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
    );
  }

  @override
  ThemeExtension<OneShapeTheme> lerp(
    ThemeExtension<OneShapeTheme>? other,
    double t,
  ) {
    if (other is! OneShapeTheme) return this;

    return OneShapeTheme(
      radius: Radius.lerp(radius, other.radius, t) ?? radius,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }
}

extension OneShapeThemeExtension on ThemeData {
  OneShapeTheme get shape => extension<OneShapeTheme>()!;
}
