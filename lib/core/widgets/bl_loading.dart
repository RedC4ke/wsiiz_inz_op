import 'package:bucket_list/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class BlLoading extends StatelessWidget {
  const BlLoading({required this.transparent, super.key});

  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: ColoredBox(
        color: transparent
            ? Colors.transparent
            : context.colorScheme.surface.withOpacity(0.3),
        child: const Center(
          child: SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          ),
        ),
      ),
    );
  }
}
