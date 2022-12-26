import 'package:flutter/material.dart';
import 'package:one/one.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: theme.spacing.edgeInsets,
      child: DefaultTextStyle(
        style: theme.textTheme.subtitle1!.copyWith(
          color: theme.colorScheme.primary,
        ),
        textAlign: TextAlign.center,
        child: child,
      ),
    );
  }
}
