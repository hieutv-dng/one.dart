import 'package:flutter/material.dart';

class OneIconDataTheme extends ThemeExtension<OneIconDataTheme> {
  OneIconDataTheme({
    required this.drawer,
    required this.close,
    required this.back,
    required this.expand,
  });

  final WidgetBuilder drawer;
  final WidgetBuilder close;
  final WidgetBuilder back;
  final WidgetBuilder expand;

  @override
  ThemeExtension<OneIconDataTheme> copyWith({
    WidgetBuilder? drawer,
    WidgetBuilder? close,
    WidgetBuilder? back,
    WidgetBuilder? expand,
  }) {
    return OneIconDataTheme(
      drawer: drawer ?? this.close,
      close: close ?? this.close,
      back: back ?? this.back,
      expand: expand ?? this.expand,
    );
  }

  @override
  ThemeExtension<OneIconDataTheme> lerp(
    ThemeExtension<OneIconDataTheme>? other,
    double t,
  ) {
    return other ?? this;
  }
}

extension OneIconDataThemeExtension on ThemeData {
  OneIconDataTheme get iconData => extension<OneIconDataTheme>()!;
}
