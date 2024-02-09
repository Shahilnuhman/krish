


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krish/support/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  late final String text;
  late final double width;
  late final double height;
  late final Function onPressed;
  late final bool loading;
  final TextStyle? textStyle;
  final Color? color;
  final bool isDisabled;
  final Widget? child;
  PrimaryButton(
      {required this.text,
      this.width = double.infinity,
      this.height = 50.0,
      required this.onPressed,
      this.loading = false,
      this.color,
      this.textStyle,
      this.isDisabled = false,
      this.child});
  PrimaryButton.text({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textStyle,
    required this.width,
    required this.height,
    required this.loading,
    this.isDisabled = false,
    this.child,
  }) : super(key: key) {
    loading = false;
    width = double.infinity;
    height = 50.0;
  }
  PrimaryButton.loading({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.color,
    this.textStyle,
    required this.width,
    required this.height,
    this.isDisabled = false,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(200, 58)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          backgroundColor: isDisabled
              ? MaterialStateProperty.all(color ?? colors(context).primaryStroke!.withOpacity(0.5))
              : MaterialStateProperty.all(color ?? const Color(0xffE21E26)),
          elevation: MaterialStateProperty.all(0),
          shadowColor: MaterialStateProperty.all(color ?? Colors.transparent),
        ),
        onPressed: () {
          if (!loading && !isDisabled) {
            HapticFeedback.lightImpact();
            onPressed();
          }
        },
        child: loading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: textStyle ??
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: child,
                  )
                ],
              ),
      ),
    );
  }
}
