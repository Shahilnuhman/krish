import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

class AppColors extends ThemeExtension<AppColors> {
  final Color? background;
  final Color? primary;
  final Color? text;
  final Color? description;
  final Color? primaryIcon;
  final Color? disable;
  final Color? secondary;
  final Color? white;
  final Color? tertiary;
  final Color? black;
  final Color? iconBackground;
  final Color? primaryStroke;
  final Color? disableLight;
  final Color? blueGrey;
  final Color? header;

  const AppColors(
      {required this.background,
      required this.primary,
      required this.text,
      required this.description,
      required this.primaryIcon,
      required this.disable,
      required this.secondary,
      required this.white,
      required this.tertiary,
      required this.black,
      required this.iconBackground,
      required this.primaryStroke,
      required this.disableLight,
      required this.blueGrey,
      required this.header});

  @override
  AppColors copyWith(
      {Color? background,
      Color? primary,
      Color? text,
      Color? description,
      Color? primaryIcon,
      Color? disable,
      Color? secondary,
      Color? white,
      Color? tertiary,
      Color? black,
      Color? iconBackground,
      Color? primaryStroke,
      Color? disableLight,
      Color? blueGrey,
      Color? header}) {
    return AppColors(
        background: background ?? this.background,
        primary: primary ?? this.primary,
        text: text ?? this.text,
        description: description ?? this.description,
        primaryIcon: primaryIcon ?? this.primaryIcon,
        disable: disable ?? this.disable,
        secondary: secondary ?? this.secondary,
        white: white ?? this.white,
        tertiary: tertiary ?? this.tertiary,
        black: black ?? this.black,
        iconBackground: iconBackground ?? this.iconBackground,
        primaryStroke: primaryStroke ?? this.primaryStroke,
        disableLight: disableLight ?? this.disableLight,
        blueGrey: blueGrey ?? this.blueGrey,
        header: header ?? this.header);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
        background: Color.lerp(background, other.background, t),
        primary: Color.lerp(primary, other.primary, t),
        text: Color.lerp(text, other.text, t),
        description: Color.lerp(description, other.description, t),
        primaryIcon: Color.lerp(primaryIcon, other.primaryIcon, t),
        disable: Color.lerp(disable, other.disable, t),
        secondary: Color.lerp(secondary, other.secondary, t),
        white: Color.lerp(white, other.white, t),
        tertiary: Color.lerp(tertiary, other.tertiary, t),
        black: Color.lerp(black, other.black, t),
        iconBackground: Color.lerp(iconBackground, other.iconBackground, t),
        primaryStroke: Color.lerp(primaryStroke, other.primaryStroke, t),
        disableLight: Color.lerp(disableLight, other.disableLight, t),
        blueGrey: Color.lerp(blueGrey, other.blueGrey, t),
        header: Color.lerp(header, other.header, t));
  }
}
