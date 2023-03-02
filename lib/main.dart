import 'package:flutter/material.dart';
import 'package:travel/screens/Onboarding.dart';
import 'package:travel/screens/Onboarding2.dart';
import 'package:flutter/services.dart';
import 'package:travel/screens/home_screen.dart';

import 'screens/Example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
   ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, color: Colors.grey)
        )
      ),
      home: Example(),
    );
  }
}
