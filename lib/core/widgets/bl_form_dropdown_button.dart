import 'package:bucket_list/core/utils/extensions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart';

class BlFormDropdownButton<T> extends StatelessWidget {
  const BlFormDropdownButton({
    required this.hint,
    required this.items,
    this.label,
    this.validator,
    this.value,
    this.onChanged,
    this.isLeadingIcon = true,
    this.borderRadius = 15,
    super.key,
  });

  final FormFieldValidator<T>? validator;
  final String hint;
  final String? label;
  final List<DropdownMenuItem<Either<VoidCallback, T>>> items;
  final ValueChanged<T?>? onChanged;
  final bool isLeadingIcon;
  final T? value;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final dropdownValue =
        this.value != null ? right<VoidCallback, T>(this.value as T) : null;

    return FormField<T>(
      validator: validator,
      initialValue: value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != null)
              Text(
                label ?? '',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            DropdownButton2<Either<VoidCallback, T>?>(
              style: context.textTheme.bodyLarge,
              underline: const SizedBox.shrink(),
              enableFeedback: true,
              iconStyleData: IconStyleData(
                icon: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  color: isLeadingIcon ? null : Colors.transparent,
                ),
              ),
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: context.colorScheme.outline,
                  ),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: context.colorScheme.outline,
                  ),
                ),
              ),
              isExpanded: true,
              value: dropdownValue,
              hint: Text(
                hint,
                style: context.textTheme.bodyLarge,
              ),
              items: items,
              onChanged: (v) {
                v?.fold(
                  (callback) => callback(),
                  (value) {
                    state.didChange(value);
                    onChanged?.call(value);
                  },
                );
              },
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  state.errorText ?? '',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
