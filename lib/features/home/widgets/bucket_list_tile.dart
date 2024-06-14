import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/navigation/app_router.dart';
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
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        boxShadow: BlDecorations.shadowMedium,
        borderRadius: BorderRadius.circular(8),
        color: context.theme.colorScheme.surfaceTint,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.pushRoute(
            BucketListRoute(bucketList: bucketList),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlCachedImage(
                  imageUrl: bucketList.imageUrl,
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  bucketList.name,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
