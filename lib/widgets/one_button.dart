import 'package:flutter/material.dart';
import 'package:one/one.dart';

abstract class OneButton extends StatelessWidget {
  const OneButton();

  /// A [TextButton] based on the [ThemeData.textButtonTheme].
  const factory OneButton.text({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    Widget? iconEnd,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _OneTextButton;

  /// An [ElevatedButton] based on the [ThemeData.elevatedButtonTheme].
  const factory OneButton.elevated({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    Widget? iconEnd,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _OneElevatedButton;

  /// An [ElevatedButton] based on the [ThemeData.outlinedButtonTheme].
  const factory OneButton.outlined({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    Widget? iconEnd,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _OneOutlinedButton;

  /// A flat transparent button with even vertical and horizontal padding.
  const factory OneButton.transparent({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    Widget? iconEnd,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
  }) = _OneTransparentButton;

  /// A flat button that matches the style of a [Card] with even vertical and
  /// horizontal padding.
  const factory OneButton.card({
    required VoidCallback? onTap,
    Widget? icon,
    Widget? label,
    Widget? iconEnd,
    VoidCallback? onLongPress,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    Color? backgroundColor,
  }) = _OneCardButton;
}

class _OneTextButton extends OneButton {
  const _OneTextButton({
    required this.onTap,
    this.icon,
    this.label,
    this.iconEnd,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final Widget? iconEnd;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      style: theme.textButtonTheme.style?.copyWith(
        padding: WidgetStateProperty.all(padding),
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
          if (iconEnd != null && label != null) HorizontalSpacer.small,
          if (iconEnd != null) iconEnd!,
        ],
      ),
    );
  }
}

class _OneElevatedButton extends OneButton {
  const _OneElevatedButton({
    required this.onTap,
    this.icon,
    this.label,
    this.iconEnd,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final Widget? iconEnd;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: theme.textButtonTheme.style?.copyWith(
        padding:
            WidgetStateProperty.all(padding ?? theme.spacing.smallEdgeInsets),
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
          if (iconEnd != null && label != null) HorizontalSpacer.small,
          if (iconEnd != null) iconEnd!,
        ],
      ),
    );
  }
}

class _OneOutlinedButton extends OneButton {
  const _OneOutlinedButton({
    required this.onTap,
    this.icon,
    this.label,
    this.iconEnd,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final Widget? iconEnd;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      style: theme.textButtonTheme.style?.copyWith(
        padding:
            WidgetStateProperty.all(padding ?? theme.spacing.smallEdgeInsets),
      ),
      onPressed: onTap,
      onLongPress: onLongPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
          if (iconEnd != null && label != null) HorizontalSpacer.small,
          if (iconEnd != null) iconEnd!,
        ],
      ),
    );
  }
}

class _OneTransparentButton extends OneButton {
  const _OneTransparentButton({
    required this.onTap,
    this.icon,
    this.label,
    this.iconEnd,
    this.onLongPress,
    this.padding,
  });

  final Widget? icon;
  final Widget? label;
  final Widget? iconEnd;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? theme.colorScheme.onSurface.withOpacity(.5)
            : theme.colorScheme.onSurface,
      ),
      overlayColor: WidgetStateProperty.all(theme.highlightColor),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        padding ?? theme.spacing.smallEdgeInsets,
      ),
    );

    return TextButton(
      onPressed: onTap,
      onLongPress: onLongPress,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
          if (iconEnd != null && label != null) HorizontalSpacer.small,
          if (iconEnd != null) iconEnd!,
        ],
      ),
    );
  }
}

class _OneCardButton extends OneButton {
  const _OneCardButton({
    required this.onTap,
    this.icon,
    this.label,
    this.iconEnd,
    this.onLongPress,
    this.padding,
    this.foregroundColor,
    this.backgroundColor,
  });

  final Widget? icon;
  final Widget? label;
  final Widget? iconEnd;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = backgroundColor ?? theme.cardTheme.color!;
    final foreground = foregroundColor ?? theme.colorScheme.onSurface;

    final style = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? background.withOpacity(0)
            : background,
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled)
            ? foreground.withOpacity(.5)
            : foreground,
      ),
      overlayColor: WidgetStateProperty.all(theme.highlightColor),
      elevation: WidgetStateProperty.all(theme.cardTheme.elevation),
      padding: WidgetStateProperty.all(
        padding ?? theme.spacing.smallEdgeInsets,
      ),
    );

    return ElevatedButton(
      onPressed: onTap,
      onLongPress: onLongPress,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && label != null) HorizontalSpacer.small,
          if (label != null) label!,
          if (iconEnd != null && label != null) HorizontalSpacer.small,
          if (iconEnd != null) iconEnd!,
        ],
      ),
    );
  }
}
