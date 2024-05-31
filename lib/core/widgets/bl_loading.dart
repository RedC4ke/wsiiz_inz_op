import 'package:bucket_list/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class BlLoading extends StatelessWidget {
  const BlLoading({this.transparent = true, super.key});

  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: ColoredBox(
        color: transparent
            ? Colors.transparent
            : context.colorScheme.surface.withOpacity(0.45),
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
