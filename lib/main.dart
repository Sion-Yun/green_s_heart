import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logInPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white12),
        ),
        home: LogInPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}