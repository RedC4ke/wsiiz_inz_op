import 'package:bucket_list/core/theme/bl_decorations.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:bucket_list/features/bucket_list/application/bucket_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BucketListItemTile extends HookConsumerWidget {
  const BucketListItemTile({
    required this.bucketList,
    required this.bucketListItem,
    super.key,
  });

  final BucketList bucketList;
  final BucketListItem bucketListItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
    final isExpandable = bucketListItem.description.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: BlDecorations.shadowSmall,
        color: context.theme.colorScheme.surface,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          children: [
            Expanded(
              flex: 12,
              child: InkWell(
                onTap: isExpandable
                    ? () {
                        isExpanded.value = !isExpanded.value;
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bucketListItem.title,
                        style: context.textTheme.headlineSmall?.copyWith(
                          decoration: bucketListItem.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      if (bucketListItem.description.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          alignment: Alignment.topCenter,
                          child: isExpanded.value
                              ? Text(
                                  bucketListItem.description,
                                  style: context.textTheme.bodySmall,
                                )
                              : Text(
                                  bucketListItem.description,
                                  style: context.textTheme.bodySmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                        const SizedBox(height: 2),
                        Align(
                          alignment: Alignment.topCenter,
                          child: FaIcon(
                            isExpanded.value
                                ? FontAwesomeIcons.chevronUp
                                : FontAwesomeIcons.chevronDown,
                            size: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Checkbox(
                  value: bucketListItem.isCompleted,
                  onChanged: (value) {
                    ref
                        .read(
                          bucketListControllerProvider(bucketList).notifier,
                        )
                        .toggleCompletion(bucketListItem);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
