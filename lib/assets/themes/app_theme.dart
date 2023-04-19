import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/assets/colors/theme_colors.dart';
import 'package:surf_flutter_study_jam_2023/config/fonts.dart';

ThemeData getThemeData(BuildContext context) => ThemeData.light().copyWith(
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      scaffoldBackgroundColor: backgroundColor,
      dividerColor: dividerColor,
      splashColor: dividerColor.withOpacity(.32),
      iconTheme: const IconThemeData(color: iconColor),
      highlightColor: Colors.transparent,
      colorScheme: const ColorScheme.light(
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
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.0,
          color: textColor,
        ),
        bodySmall: TextStyle(
          fontSize: 14.0,
          color: textColor,
        ),
      ).apply(
        fontFamily: defaultFont,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
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
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
          color: greyTextColor,
          fontFamily: defaultFont,
          fontSize: 12.8,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelStyle: const TextStyle(
          color: greyTextColor,
          fontFamily: defaultFont,
          fontSize: 15.8,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(color: textColor),
        filled: true,
        fillColor: textFieldFillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 6.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.5),
          borderSide: BorderSide.none,
        ),
      ),
      dialogBackgroundColor: backgroundColor,
      dialogTheme: const DialogTheme(
        alignment: Alignment.center,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.5)),
        ),
        titleTextStyle: TextStyle(
          fontFamily: defaultFont,
          fontSize: 20.0,
          color: textColor,
        ),
        contentTextStyle: TextStyle(
          fontFamily: defaultFont,
          fontSize: 16.0,
          color: textColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          disabledForegroundColor: dividerColor,
        ),
      ),
      cardTheme: CardTheme(
        color: backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: backgroundColor,
        textStyle: TextStyle(
          fontSize: 16.0,
          fontFamily: defaultFont,
          color: textColor,
        ),
      ),
    );
