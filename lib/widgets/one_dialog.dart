import 'package:flutter/material.dart';
import 'package:one/one.dart';

class OneDialog extends StatelessWidget {
  const OneDialog({
    this.title,
    this.stickyContent,
    this.content,
    this.actions,
    this.clipBehavior = Clip.none,
    this.titlePadding,
    this.contentPadding,
    this.actionsPadding,
  });

  final Widget? title;
  final Widget? stickyContent;
  final Widget? content;
  final List<Widget>? actions;

  final Clip clipBehavior;

  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? actionsPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget? titleWidget;

    if (title != null) {
      titleWidget = Center(
        child: Padding(
          padding: titlePadding ??
              (theme.spacing.edgeInsets * 2).copyWith(bottom: 0),
          child: DefaultTextStyle(
            style: theme.textTheme.titleLarge!,
            textAlign: TextAlign.center,
            child: title!,
          ),
        ),
      );
    }

    return Unfocus(
      child: Dialog(
        clipBehavior: clipBehavior,
        child: OneAnimatedSize(
          curve: Curves.easeInOut,
          alignment: AlignmentDirectional.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (titleWidget != null) titleWidget,
                if (stickyContent != null) stickyContent!,
                Flexible(
                  child: Padding(
                    padding: contentPadding ?? theme.spacing.edgeInsets,
                    child: DefaultTextStyle(
                      style: theme.textTheme.titleSmall!,
                      child: SingleChildScrollView(child: content),
                    ),
                  ),
                ),
                if (actions != null)
                  OneDialogActionBar(
                    actions: actions!,
                    padding: actionsPadding,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Displays a list of [actions] (usually buttons) in an [OverflowBar].
class OneDialogActionBar extends StatelessWidget {
  const OneDialogActionBar({
    required this.actions,
    this.padding,
  });

  final List<Widget> actions;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? theme.spacing.edgeInsets.copyWith(top: 0),
      child: OverflowBar(
        alignment: MainAxisAlignment.spaceAround,
        spacing: theme.spacing.base,
        overflowSpacing: theme.spacing.small,
        overflowAlignment: OverflowBarAlignment.center,
        children: actions,
      ),
    );
  }
}
