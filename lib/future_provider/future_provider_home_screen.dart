import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/future_provider/provider_services.dart';

class FutureProviderHomeScreen extends ConsumerWidget {
  const FutureProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureProviderData = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider Learning")),
      body: Center(
        child: futureProviderData.when(
          data: (data) => Text(data),
          error: (err, stack) => Text("Error is $err"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
