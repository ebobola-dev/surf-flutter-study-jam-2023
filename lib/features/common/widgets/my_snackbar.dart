import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/assets/colors/theme_colors.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/icons_paths.dart';
import 'package:surf_flutter_study_jam_2023/assets/themes/paddings.dart';

class MySnackBar {
  static Future<void> _show(
    BuildContext context, {
    String? iconPath,
    required String message,
    Color color = textColor,
    Duration duration = const Duration(seconds: 3),
    Widget? mainButton,
  }) async {
    Flushbar(
      duration: duration,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(defaultPadding),
      borderRadius: BorderRadius.circular(10.0),
      mainButton: mainButton,
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
              width: 20.0,
            ),
            const SizedBox(width: 12.0),
          ],
          Flexible(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: color,
                  ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      boxShadows: [
        BoxShadow(
          color: color.withOpacity(.35),
          offset: const Offset(0.0, 4.0),
          blurRadius: 10.0,
          spreadRadius: 1.0,
        ),
      ],
    ).show(context);
  }

  static Future<void> showError(
    BuildContext context, {
    required String error,
    Duration duration = const Duration(seconds: 3),
    Widget? mainButton,
  }) async {
    _show(
      context,
      iconPath: IconPaths.error,
      message: error,
      color: errorSnackBarColor,
      mainButton: mainButton,
    );
  }

  static Future<void> showWarning(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Widget? mainButton,
  }) async {
    _show(
      context,
      message: message,
      iconPath: IconPaths.warning,
      color: warningSnackBarColor,
      mainButton: mainButton,
    );
  }

  static Future<void> showSuccess(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Widget? mainButton,
  }) async {
    _show(
      context,
      message: message,
      iconPath: IconPaths.success,
      color: successSnackBarColor,
      mainButton: mainButton,
    );
  }
}
