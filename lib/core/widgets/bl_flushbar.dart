import 'package:another_flushbar/flushbar.dart';
import 'package:bucket_list/core/theme/bl_colors.dart';
import 'package:flutter/material.dart';

const Duration _duration = Duration(seconds: 3);
const Duration _animationDuration = Duration(milliseconds: 300);

// ignore: must_be_immutable
class BlFlushbar extends Flushbar<void> {
  BlFlushbar({
    required String content,
    required super.backgroundColor,
    required super.messageColor,
    super.key,
  }) : super(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          borderRadius: BorderRadius.circular(16),
          flushbarStyle: FlushbarStyle.FLOATING,
          boxShadows: const [
            BoxShadow(
              color: Color(0x260F283C),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
          duration: _duration,
          message: content,
          forwardAnimationCurve: Curves.easeOutCirc,
          animationDuration: _animationDuration,
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        );

  factory BlFlushbar.warning({
    required String content,
  }) =>
      BlFlushbar(
        content: content,
        backgroundColor: BlColors.yellowLightest,
        messageColor: BlColors.yellowDarkest,
      );

  factory BlFlushbar.success({
    required String content,
  }) =>
      BlFlushbar(
        content: content,
        backgroundColor: BlColors.greenLightest,
        messageColor: BlColors.greenDarkest,
      );

  factory BlFlushbar.error({
    required String content,
  }) =>
      BlFlushbar(
        content: content,
        backgroundColor: BlColors.redLightest,
        messageColor: BlColors.redDarkest,
      );

  @override
  Widget get messageText => Text(
        message!,
        style: TextStyle(
          color: messageColor,
          height: 1.3,
        ), // Updated to use local style
        textAlign: TextAlign.start,
      );

  Future<void> showWithContext(BuildContext context) {
    if (BlFlushbar.mountedContext(context)) {
      return show(context);
    }
    return Future.value();
  }

  static bool mountedContext(BuildContext context) {
    final state = context.findRenderObject();
    return state?.attached ?? false;
  }
}
