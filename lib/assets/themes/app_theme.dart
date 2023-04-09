import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/assets/colors/theme_colors.dart';
import 'package:surf_flutter_study_jam_2023/assets/srtings/fonts.dart';

ThemeData getThemeData(BuildContext context) => ThemeData.light().copyWith(
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      scaffoldBackgroundColor: backgroundColor,
      splashColor: primaryColor,
      iconTheme: const IconThemeData(color: iconColor),
      colorScheme: const ColorScheme.dark(
        background: backgroundColor,
        primary: primaryColor,
        secondary: secondaryColor,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        titleMedium: TextStyle(
          fontSize: 25.0,
          color: textColor,
        ),
        titleSmall: TextStyle(
          fontSize: 20.0,
          color: textColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 20.0,
          color: greyTextColor,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.0,
          color: greyTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12.8,
          color: greyTextColor,
        ),
      ).apply(
        fontFamily: defaultFont,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: dividerColor,
          backgroundColor: textColor,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5),
          ),
          shadowColor: textColor,
          textStyle: const TextStyle(
            color: backgroundColor,
            fontFamily: defaultFont,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
