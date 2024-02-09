import 'dart:async';

import 'package:flutter/material.dart';
import 'package:krish/modules/home/view/homeScreenPage.dart';

class SplashScreenPage
 extends StatelessWidget {
  const SplashScreenPage
  ({super.key});

  @override
  Widget build(BuildContext context) {
        Timer(const Duration(seconds: 4), () => Navigator.push(context, HomeScreenPage.route()));
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(width:double.infinity,height: double.infinity,
      child:Image.asset("assets/images/splash.jpeg",) )
    );
  }
}