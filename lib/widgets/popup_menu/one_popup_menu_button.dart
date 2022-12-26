import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one/one.dart';

/// A custom popup menu button that calls [showOneMenu] to show a menu.
class OnePopupMenuButton<T> extends StatefulWidget {
  const OnePopupMenuButton({
    required this.itemBuilder,
    this.onSelected,
    this.onCancelled,
    this.enabled = true,
  });

  final PopupMenuItemBuilder<T> itemBuilder;
  final PopupMenuItemSelected<T>? onSelected;
  final VoidCallback? onCancelled;
  final bool enabled;

  @override
  State<OnePopupMenuButton<T>> createState() => _OnePopupMenuButtonState<T>();
}

class _OnePopupMenuButtonState<T> extends State<OnePopupMenuButton<T>> {
  void _showButtonMenu() {
    final button = context.findRenderObject()! as RenderBox;
    final overlay = Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;

    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    final items = widget.itemBuilder(context);

    if (items.isNotEmpty) {
      showOneMenu(
        context: context,
        items: items,
        position: position,
      ).then((newValue) {
        if (!mounted) return;

        if (newValue == null) {
          widget.onCancelled?.call();
        } else {
          HapticFeedback.lightImpact();
          widget.onSelected?.call(newValue);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OneButton.transparent(
      icon: const Icon(CupertinoIcons.ellipsis_vertical),
      onTap: widget.enabled ? _showButtonMenu : null,
    );
  }
}

class OnePopupMenuListTile<T> extends PopupMenuEntry<T> {
  const OnePopupMenuListTile({
    required this.value,
    this.leading,
    this.title,
    this.trailing,
    this.enabled = true,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  /// The value that will be returned by [showMenu] if this entry is selected.
  ///
  /// When `null`, [OnePopupMenuButton.onCancelled] will be called if this
  /// item is selected.
  final T? value;

  /// Whether the user is permitted to select this item.
  final bool enabled;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == this.value;

  @override
  State<OnePopupMenuListTile<T>> createState() => _OnePopupMenuListTileState<T, OnePopupMenuListTile<T>>();
}

class _OnePopupMenuListTileState<T, W extends OnePopupMenuListTile<T>> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return OneListTile(
      leading: widget.leading,
      title: widget.title,
      trailing: widget.trailing,
      borderRadius: BorderRadius.zero,
      onTap: widget.enabled ? () => Navigator.of(context).pop(widget.value) : null,
    );
  }
}

class OnePopupMenuRow<T> extends PopupMenuEntry<T> {
  const OnePopupMenuRow({
    required this.children,
  }) : assert(children.length <= 4);

  final List<OnePopupMenuIcon<T>> children;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => false;

  @override
  State<OnePopupMenuRow<T>> createState() => _OnePopupMenuRow<T, OnePopupMenuRow<T>>();
}

class _OnePopupMenuRow<T, W extends OnePopupMenuRow<T>> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.children,
    );
  }
}

class OnePopupMenuIcon<T> extends PopupMenuEntry<T> {
  const OnePopupMenuIcon({
    required this.value,
    required this.icon,
    this.enabled = true,
  });

  final Widget icon;

  /// The value that will be returned by [showMenu] if this entry is selected.
  ///
  /// When `null`, [OnePopupMenuButton.onCancelled] will be called if this
  /// item is selected.
  final T? value;

  final bool enabled;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == this.value;

  @override
  State<OnePopupMenuIcon<T>> createState() => _OnePopupMenuIcon<T, OnePopupMenuIcon<T>>();
}

class _OnePopupMenuIcon<T, W extends OnePopupMenuIcon<T>> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return OneButton.transparent(
      icon: widget.icon,
      onTap: widget.enabled ? () => Navigator.of(context).pop(widget.value) : null,
    );
  }
}
