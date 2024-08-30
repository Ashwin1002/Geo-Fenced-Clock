import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geo_fenced_clock/core/core.dart';

const _snackDuration = Duration(milliseconds: 2000);

class Snack {
  static void _show(
    BuildContext context,
    String message, {
    IconData? iconData,
    Color? color,
    Color? textColor,
    Color? iconColor,
    Duration? duration,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration ?? _snackDuration,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              border: Border(
                top: BorderSide(
                  color: iconColor ?? AppColors.transparent,
                  width: 5,
                ),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData ?? Icons.check,
                  color: iconColor ?? AppColors.backgroundPrimaryLight,
                  size: 30,
                ),
                10.0.horizontalSpace,
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 14.0).copyWith(
                      color: textColor ?? AppColors.contentSecondaryLight,
                    ),
                  ),
                ),
                10.0.horizontalSpace,
                IconButton(
                  onPressed: () {
                    scaffoldMessenger.hideCurrentSnackBar();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.zero,
          backgroundColor: color ?? AppColors.negativeLight,
          elevation: 4,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  static void success(BuildContext context, String? message) {
    _show(
      context,
      message ?? 'Success',
      color: AppColors.backgroundPrimaryLight,
      iconColor: AppColors.positiveLight,
    );
  }

  static void error(BuildContext context, String? message) {
    _show(
      context,
      message ?? 'Some Error occurred',
      color: AppColors.negativeLight,
      textColor: AppColors.primaryLightA,
      iconColor: AppColors.negativeLight,
      iconData: CupertinoIcons.clear_circled,
    );
  }
}
