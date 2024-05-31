import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/utils/listeners.dart';
import 'package:bucket_list/core/utils/validators.dart';
import 'package:bucket_list/core/widgets/bl_app_bar.dart';
import 'package:bucket_list/core/widgets/bl_loading.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:bucket_list/features/bucket_list/application/add_bucket_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<BucketList>()
class AddBucketListPage extends HookConsumerWidget {
  const AddBucketListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addBucketListControllerProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    ref.listen(
      addBucketListControllerProvider,
      (p, n) => Listeners.loadableStateListener(
        context,
        context.s.saved,
        p,
        n,
      ),
    );

    void addList() {
      final list = BucketList(
        name: nameController.text,
        description: descriptionController.text,
      );

      ref
          .read(addBucketListControllerProvider.notifier)
          .addBucketList(list: list);
    }

    return Stack(
      children: [
        Form(
          key: formKey,
          child: Scaffold(
            appBar: BlAppBar(
              title: context.s.create_bucket_list,
              actions: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.circlePlus),
                  onPressed: () {
                    if (!(formKey.currentState?.validate() ?? true)) {
                      return;
                    }

                    addList();
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: context.s.name,
                      ),
                      validator: (text) => Validators.minLength(
                        context,
                        text,
                        Validators.nameMinLength,
                      ),
                      maxLength: Validators.nameMaxLength,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        labelText: context.s.description,
                      ),
                      maxLines: 5,
                      maxLength: Validators.descriptionMaxLenth,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () {
            return const BlLoading(
              transparent: false,
            );
          },
        ),
      ],
    );
  }
}
