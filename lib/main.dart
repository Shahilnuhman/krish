import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/app/app.dart';


final _navigatorKey = GlobalKey<NavigatorState>();

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(ProviderScope(
      child: MyApp(
    navigatorKey: _navigatorKey,
  )));
}



