import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/future_provider/again/stream_provider_services.dart';

class StreamProviderHomeScreenAgain extends ConsumerWidget {
  const StreamProviderHomeScreenAgain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamProviderNumber = ref.watch(streamProviderServices);
    return Scaffold(
      appBar: AppBar(title: Text("Number from Stream Provider")),
      body: Center(
        child: streamProviderNumber.when(
          data: (data) => Text(data.toString(), style: TextStyle(fontSize: 50)),
          error: (error, stack) => Text("error is $error"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
