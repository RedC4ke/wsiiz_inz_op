import 'package:auto_route/auto_route.dart';
import 'package:bucket_list/domain/bucket_list/models/bucket_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class BucketListPage extends ConsumerWidget {
  const BucketListPage({
    required this.bucketList,
    super.key,
  });

  final BucketList bucketList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bucketList.name),
      ),
      body: Center(
        child: Text('Bucket List Page'),
      ),
    );
  }
}
