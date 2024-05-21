import 'package:flutter/material.dart';

class BlBottomNavigationBar extends StatelessWidget {
  const BlBottomNavigationBar({
    required this.items,
    super.key,
  });

  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
    );
  }
}
