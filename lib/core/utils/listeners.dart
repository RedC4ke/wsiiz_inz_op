import 'package:bucket_list/application/base/loadable_state.dart';
import 'package:bucket_list/core/widgets/bl_flushbar.dart';
import 'package:flutter/material.dart';

abstract class Listeners {
  static void loadableStateListener(
    BuildContext context,
    String successMessage,
    LoadableState<dynamic>? previous,
    LoadableState<dynamic> next, {
    bool popOnSuccess = true,
  }) {
    next.maybeWhen(
      success: (data) {
        if (popOnSuccess) {
          Navigator.of(context).pop(data);
        }
        BlFlushbar.success(content: successMessage).showWithContext(context);
      },
      error: (error) => BlFlushbar.error(content: error.message),
      orElse: () {},
    );
  }
}
