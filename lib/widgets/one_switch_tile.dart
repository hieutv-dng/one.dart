import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one/one.dart';

class OneSwitchTile extends StatelessWidget {
  const OneSwitchTile({
    required this.value,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.leading,
    this.borderRadius,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return OneListTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailingPadding: EdgeInsets.zero,
      trailing: Switch(
        value: value,
        onChanged: onChanged != null
            ? (_) {
                HapticFeedback.lightImpact();
                onChanged?.call(!value);
              }
            : null,
      ),
      borderRadius: borderRadius,
      enabled: onChanged != null,
      multilineTitle: true,
      onTap: onChanged != null
          ? () {
              HapticFeedback.lightImpact();
              onChanged?.call(!value);
            }
          : null,
    );
  }
}
