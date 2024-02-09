
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:krish/support/theme/theme.dart';

class SnackBarWidget {
  static errorSnackBar({
    required BuildContext context,
    required String message,
    Icon? icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                icon ??
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                Text(
                  " $message",
                  style: TextStyle(
                    color: colors(context).text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static successSnackBar({
    required BuildContext context,
    required String message,
    Icon? icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          content: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  icon ??
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                  Text(
                    " $message",
                    style: TextStyle(
                      color: colors(context).text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
