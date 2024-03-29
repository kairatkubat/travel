import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, color: Colors.grey)
        )
      ),
      home: Onboarding(),
    );
  }

  void onSubmitNameTextField(WidgetRef ref, String value) {
    ref.read(userStateNotifierProvider.notifier).updateName(value);
  }
}
