import 'package:bucket_list/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class AddBucketListForm extends StatelessWidget {
  const AddBucketListForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: context.s.name,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: context.s.description,
          ),
        ),
      ],
    );
  }
}
