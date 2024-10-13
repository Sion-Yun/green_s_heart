import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logInPage.dart';

void main() {
  runApp(MyApp());  // Rin MyApp widget as the first page
}

// Main widget of this application
class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Constructor with key parameter

  // MyApp's UI
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Provides myAppState to the widget tree
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'GreenSHeartApp',
        theme: ThemeData(
          useMaterial3: true,  // Material design 3 enabled
          // Defined color scheme
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white12),
        ),
        home: LogInPage(),  // Setting LogInPage as the first (home) screen
      ),
    );
  }
}

// Manages state using ChangeNotifier
class MyAppState extends ChangeNotifier {}