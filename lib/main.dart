import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/change_notifier_crud/change_notifier_homescreen.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/home_screen.dart';
// import 'package:riverpodproject/api_work/api_home_screen.dart';
// import 'package:riverpodproject/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierHomescreen(),
    );
  }
}
