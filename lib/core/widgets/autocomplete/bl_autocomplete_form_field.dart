import 'dart:async';

import 'package:bucket_list/core/utils/extensions.dart';
import 'package:bucket_list/core/widgets/autocomplete/application/autocomplete_controller.dart';
import 'package:bucket_list/core/widgets/autocomplete/bl_autocomplete_item.dart';
import 'package:bucket_list/domain/autocomplete/models/autocomplete_prediction.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlAutocompleteFormField extends ConsumerWidget {
  const BlAutocompleteFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Autocomplete<AutocompletePrediction>(
      optionsBuilder: (text) async {
        // Debounce the text input
        await Future<void>.delayed(const Duration(seconds: 1));

        final notifier = ref.read(autocompleteControllerProvider.notifier);
        final result = await notifier.fetchAutocomplete(text.text);

        return result.maybeWhen(
          orElse: () => const [],
          success: (response) => response.predictions,
        );
      },
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onFieldSubmitted,
      ) {
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          onEditingComplete: onFieldSubmitted,
          decoration: InputDecoration(
            labelText: context.s.add_location,
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Material(
          elevation: 4,
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);
                return BlAutocompleteItem(
                  prediction: option,
                  onSelected: onSelected,
                );
              },
            ),
          ),
        );
      },
      onSelected: (option) {},
    );
  }
}
