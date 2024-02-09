import 'package:flutter/material.dart';
import 'package:krish/support/theme/colors.dart'; // Importing custom color definitions

// Function to get the colors from the current theme
AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

// Function to define and return the theme data based on the provided parameters
ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    // Define custom colors using extensions
    extensions: <ThemeExtension<AppColors>>[
      AppColors(
        // Define colors based on dark or light theme
        background: isDarkTheme ? const Color(0xff181A21) : const Color(0xfff5f5f5),
        primary: const Color(0xff111111),
        text: isDarkTheme ? Colors.white : const Color(0xff000000),
        description: const Color(0xff222222),
        black: Colors.black,
        blueGrey: const Color(0xff191F3E),
        disable: isDarkTheme ? Colors.white : const Color(0xff9E9E9E),
        primaryStroke: const Color(0xffD9D9D9),
        secondary: const Color(0xff009046),
        disableLight: const Color(0xffD9D9D9),
        primaryIcon: isDarkTheme ? Colors.white : const Color(0xff181A21),
        tertiary: const Color(0xff4E88DF),
        white: isDarkTheme ? const Color(0xff292A30) : Colors.white,
        iconBackground: isDarkTheme ? const Color(0xff292A30) : const Color(0xffC5C5C5),
        header: isDarkTheme ? const Color(0xff181A21) : Colors.white,
      ),
    ],
    // Set scaffold background color
    scaffoldBackgroundColor: isDarkTheme ? const Color(0xff181A21) : const Color(0xfff5f5f5),
    // Customize text theme
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
        )
        .apply(
          bodyColor: isDarkTheme ? Colors.white : Colors.black,
          displayColor: Colors.grey,
        ),
    // Customize app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: isDarkTheme ? const Color(0xff181A21) : const Color(0xfff5f5f5),
      iconTheme: IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54),
    ),
    // Set the target platform
    platform: TargetPlatform.iOS,
    // Define primary swatch and color
    primarySwatch: MaterialColor(0xffE21E26, color),
    primaryColor: Color(0xffE21E26),
    // Set the default font family
    fontFamily: 'Inter',
  );
}
