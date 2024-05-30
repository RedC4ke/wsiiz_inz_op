import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/widgets/autocomplete/bl_autocomplete_form_field.dart';
import 'package:bucket_list/core/widgets/bl_form_dropdown_button.dart';
import 'package:bucket_list/core/widgets/bl_loading.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/features/home/application/bucket_lists_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddBucketListItemForm extends HookConsumerWidget {
  const AddBucketListItemForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const vSpacer = SizedBox(height: 20);

    final bucketListsState = ref.watch(bucketListsControllerProvider);

    return bucketListsState.maybeWhen(
      orElse: () => const BlLoading(transparent: true),
      // TODO: Implement error widget
      error: (failure) => Text(failure.toString()),
      success: (bucketLists) {
        final items = bucketLists.map((e) {
          return DropdownMenuItem<Either<VoidCallback, BucketList>>(
            value: right<VoidCallback, BucketList>(e),
            child: Text(e.name),
          );
        }).toList()
          ..add(
            DropdownMenuItem<Either<VoidCallback, BucketList>>(
              value: left<VoidCallback, BucketList>(() {
                // TODO: Implement create bucket list
              }),
              child: Row(
                children: [
                  const FaIcon(FontAwesomeIcons.plus),
                  const SizedBox(width: 8),
                  Text(context.s.create_bucket_list),
                ],
              ),
            ),
          );

        return Column(
          children: [
            BlFormDropdownButton<BucketList>(
              hint: context.s.choose_bucket_list,
              items: items,
            ),
            vSpacer,
            TextFormField(
              decoration: InputDecoration(
                labelText: context.s.name,
              ),
            ),
            vSpacer,
            TextFormField(
              decoration: InputDecoration(
                labelText: context.s.description,
              ),
              maxLines: 5,
            ),
            vSpacer,
            const BlAutocompleteFormField(),
          ],
        );
      },
    );
  }
}
