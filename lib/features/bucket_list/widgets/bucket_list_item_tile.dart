import 'package:bucket_list/core/theme/bl_decorations.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:bucket_list/features/bucket_list/application/bucket_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BucketListItemTile extends HookConsumerWidget {
  const BucketListItemTile({required this.bucketListItem, super.key});

  final BucketListItem bucketListItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);

    final state = ref.watch(
      bucketListItemControllerProvider(bucketListItem),
    );

    var item = bucketListItem;

    state.maybeWhen(
      success: (data) {
        item = item.copyWith(isCompleted: data);
      },
      orElse: () {},
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: BlDecorations.shadowSmall,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: () {
                  isExpanded.value = !isExpanded.value;
                },
                child: Column(
                  children: [
                    Text(
                      bucketListItem.title,
                      style: context.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      bucketListItem.description,
                      style: context.textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        isExpanded.value
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Checkbox(
                  value: bucketListItem.isCompleted,
                  onChanged: (value) {
                    ref
                        .read(
                          bucketListItemControllerProvider(bucketListItem)
                              .notifier,
                        )
                        .toggleCompletion();
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
