import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/widgets/bl_app_bar.dart';
import 'package:bucket_list/features/bucket_list/widgets/add_bucket_list_item_form.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddBucketListItemPage extends StatelessWidget {
  const AddBucketListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BlAppBar(
        title: context.s.add_bucket_list_item,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AddBucketListItemForm(),
      ),
    );
  }
}
