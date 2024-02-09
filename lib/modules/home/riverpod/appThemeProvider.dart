import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a Riverpod StateProvider to manage the app's theme
final appThemeProvider = StateProvider<bool>((ref) => false);
// The initial state is set to false, indicating that dark mode is initially disabled
