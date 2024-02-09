import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krish/modules/home/riverpod/appThemeProvider.dart';
import 'package:krish/modules/splash_screen.dart';
import 'package:krish/support/theme/theme.dart';

// MyApp is a StatefulWidget that relies on Riverpod for state management
class MyApp extends ConsumerStatefulWidget {
  // Global key for accessing the navigator state
  final GlobalKey<NavigatorState> navigatorKey;
  // Constructor for MyApp
  const MyApp({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

// State class for MyApp
class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  // WidgetsBinding instance to observe system events
  late final WidgetsBinding _widgetsBinding;

  // Initialization method called when the state is initialized
  @override
  void initState() {
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addObserver(this); // Add observer for system events
    super.initState();
  }

  // Method called when platform brightness changes
  @override
  void didChangePlatformBrightness() async {
    // Check if dark mode is enabled based on platform brightness
    bool isDarkModeEnabled =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    // Update app theme based on dark mode status
    ref.read(appThemeProvider.notifier).state = isDarkModeEnabled;
    super.didChangePlatformBrightness();
  }

  // Build method for building the UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Provide navigator key for accessing navigator state globally
      navigatorKey: widget.navigatorKey,
      // Get app theme based on current context and state
      theme: getAppTheme(context, ref.watch(appThemeProvider)),
      // Initial page to be displayed
      home: const SplashScreenPage(),
      // Disable debug banner in release mode
      debugShowCheckedModeBanner: false,
    );
  }
}
