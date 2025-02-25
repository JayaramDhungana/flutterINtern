import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/api_home_screen.dart';
import 'package:riverpodproject/api_work/api_work_using_model/api_home_screen_using_model.dart';
import 'package:riverpodproject/api_work/api_work_using_model_provider/api_home_screen_using_model_provider.dart';
import 'package:riverpodproject/api_work/placeholder_api_work/using_change_notifier/home_screen_for_posts_change_notifier.dart';
import 'package:riverpodproject/api_work/placeholder_api_work/using_state_notifier/home_screen_for_post_state_notifier.dart';
import 'package:riverpodproject/api_work/using_model_change_notifier.dart/home_screen_for_change_notifier_api.dart';
import 'package:riverpodproject/change_notifier_crud/change_notifier_homescreen.dart';
import 'package:riverpodproject/future_provider/again/future_provider_home_screen_again.dart';
import 'package:riverpodproject/future_provider/again/stream_provider_home_screen_again.dart';
import 'package:riverpodproject/future_provider/future_provider_home_screen.dart';
import 'package:riverpodproject/future_provider/stream_provider_home.dart';
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
      home: StreamProviderHomeScreenAgain(),
    );
  }
}
