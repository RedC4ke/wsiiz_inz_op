import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/navigation/app_router.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/utils/listeners.dart';
import 'package:bucket_list/core/utils/validators.dart';
import 'package:bucket_list/core/widgets/autocomplete/bl_autocomplete_form_field.dart';
import 'package:bucket_list/core/widgets/bl_app_bar.dart';
import 'package:bucket_list/core/widgets/bl_form_dropdown_button.dart';
import 'package:bucket_list/core/widgets/bl_loading.dart';
import 'package:bucket_list/domain/autocomplete/models/autocomplete_prediction.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list_item_geolocation.dart';
import 'package:bucket_list/features/bucket_list/application/add_bucket_list_item_controller.dart';
import 'package:bucket_list/features/home/application/bucket_lists_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AddBucketListItemPage extends HookConsumerWidget {
  const AddBucketListItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addBucketListItemControllerProvider);

    ref.listen(
      addBucketListItemControllerProvider,
      (p, n) => Listeners.loadableStateListener(
        context,
        context.s.saved,
        p,
        n,
      ),
    );

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final bucketListState = useState<BucketList?>(null);
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final locationState = useState<AutocompletePrediction?>(null);

    const vSpacer = SizedBox(height: 20);

    final bucketListsState = ref.watch(bucketListsControllerProvider);

    void addItem() {
      final location = locationState.value != null
          ? BucketListItemGeolocation(
              name: locationState.value!.description,
              placeId: locationState.value!.placeId ?? '',
            )
          : null;

      final item = BucketListItem(
        listId: bucketListState.value!.id!,
        title: nameController.text,
        description: descriptionController.text,
        geolocation: location,
        isCompleted: false,
      );

      ref
          .read(addBucketListItemControllerProvider.notifier)
          .addBucketListItem(item: item);
    }

    return Stack(
      children: [
        Form(
          key: formKey,
          child: Scaffold(
            appBar: BlAppBar(
              title: context.s.add_bucket_list_item,
              actions: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.circlePlus),
                  onPressed: () {
                    if (!(formKey.currentState?.validate() ?? true)) {
                      return;
                    }

                    addItem();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: bucketListsState.maybeWhen(
                  orElse: () => const BlLoading(),
                  // TODO: Implement error widget
                  error: (failure) => Text(failure.toString()),
                  success: (bucketLists) {
                    final sorted = bucketLists
                      ..sort((a, b) => a.name.compareTo(b.name));

                    final items = sorted.map((e) {
                      return DropdownMenuItem<Either<VoidCallback, BucketList>>(
                        value: right<VoidCallback, BucketList>(e),
                        child: Text(e.name),
                      );
                    }).toList()
                      ..add(
                        DropdownMenuItem<Either<VoidCallback, BucketList>>(
                          value: left<VoidCallback, BucketList>(() async {
                            final list = await context.pushRoute(
                              const AddBucketListRoute(),
                            );

                            if (list != null && list is BucketList) {
                              bucketListState.value = list;
                            }
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
                          value: bucketListState.value,
                          hint: context.s.choose_bucket_list,
                          items: items,
                          onChanged: (value) => bucketListState.value = value,
                          validator: (value) => Validators.notEmpty(
                            context,
                            value?.name,
                          ),
                        ),
                        vSpacer,
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: context.s.name,
                          ),
                          validator: (v) => Validators.minLength(context, v, 4),
                          maxLength: Validators.nameMaxLength,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        vSpacer,
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: context.s.description,
                          ),
                          maxLines: 5,
                          maxLength: Validators.descriptionMaxLenth,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        vSpacer,
                        BlAutocompleteFormField(
                          onSelected: (v) {
                            locationState.value = v;
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () {
            return const BlLoading(transparent: false);
          },
        ),
      ],
    );
  }
}
