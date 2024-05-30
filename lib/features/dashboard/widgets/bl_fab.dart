import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/navigation/app_router.dart';
import 'package:bucket_list/core/theme/bl_decorations.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlFab extends StatelessWidget {
  const BlFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: BlDecorations.shadowSmall,
      ),
      child: FloatingActionButton(
        onPressed: () {
          context.pushRoute(const AddBucketListItemRoute());
        },
        child: Stack(
          children: [
            const FaIcon(
              FontAwesomeIcons.bucket,
              size: 30,
            ),
            Positioned(
              bottom: 1,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 16,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
