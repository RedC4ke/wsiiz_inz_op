import 'package:flutter/material.dart';

class BLAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BLAppBar({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      elevation: 0,
    );
  }
}
