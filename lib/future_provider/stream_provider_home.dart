import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/future_provider/provider_services.dart';

class StreamProviderHome extends ConsumerWidget {
  const StreamProviderHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final a = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Stream Provider Learning")),
      body: Center(
        child: a.when(
          data: (data) => Text(data.toString(), style: TextStyle(fontSize: 50)),
          error: (error, stack) => Text("Error is $error"),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
