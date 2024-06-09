import 'package:bucket_list/core/theme/bl_decorations.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/widgets/bl_cached_image.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:flutter/material.dart';

class BucketListTile extends StatelessWidget {
  const BucketListTile({
    required this.bucketList,
    super.key,
  });

  final BucketList bucketList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: BlDecorations.shadowMedium,
        borderRadius: BorderRadius.circular(8),
        color: context.theme.colorScheme.surfaceDim,
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Column(
            children: [
              BlCachedImage(
                imageUrl: bucketList.imageUrl,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Text(
                  bucketList.name,
                  style: context.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
