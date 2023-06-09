import 'package:flutter/material.dart';

import 'color_scheme.dart';
import 'home_screen.dart';

/// This is the main function that initializes the Flutter app and runs it.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// The MyApp class returns a MaterialApp widget with light and dark themes, a home screen, and a
/// right-to-left text direction.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This function returns a MaterialApp widget with light and dark themes, a home screen, and a
  /// right-to-left text direction.
  ///
  /// Args:
  ///   context (BuildContext): The BuildContext is a handle to the location of a widget in the widget
  /// tree. It is used to obtain information about the location of the widget and to interact with the
  /// widget tree. It is passed as a parameter to the build() method of a widget.
  ///
  /// Returns:
  ///   A MaterialApp widget with a light and dark theme, a flag to hide the debug banner, and a
  /// Directionality widget as the home screen with a child widget called Home().
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "فلسفه علم ریاضی",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Home(),
      ),
    );
  }
}
