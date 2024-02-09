import 'package:flutter/material.dart';
import 'package:krish/support/theme/theme.dart';

class FadeShadowWidget extends StatelessWidget {
  const FadeShadowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ShaderMask(
        shaderCallback: (Rect s) {
          return  LinearGradient(colors: [
            Colors.transparent,
            colors(context).background!,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
              .createShader(s);
        },
        blendMode: BlendMode.dstOut,
        child: Container(
          color: colors(context).background,
          height: 15,
        ),
      ),
    );
  }
}
