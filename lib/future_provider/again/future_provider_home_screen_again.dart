import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/future_provider/again/future_provider_services.dart';

class FutureProviderHomeScreenAgain extends ConsumerWidget {
  const FutureProviderHomeScreenAgain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stringFromFutureProvider = ref.watch(futureProviderServices);
    return Scaffold(
      appBar: AppBar(title: Text("String from Future Provider")),
      body: Center(
        child: stringFromFutureProvider.when(
          data: (data) => Text(data),
          error: (error, stack) => Text("Error is occured : $error"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
