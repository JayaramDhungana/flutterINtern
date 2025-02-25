import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/placeholder_api_work/using_state_notifier/post_notifier_provider.dart';

class HomeScreenForPostStateNotifier extends ConsumerStatefulWidget {
  const HomeScreenForPostStateNotifier({super.key});

  @override
  ConsumerState<HomeScreenForPostStateNotifier> createState() =>
      _HomeScreenForPostStateNotifierState();
}

class _HomeScreenForPostStateNotifierState
    extends ConsumerState<HomeScreenForPostStateNotifier> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(postNotifierProvider.notifier).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Posts using StateNotifier"),
      ),
      body: ListView.builder(
        itemCount: posts.posts.length,
        itemBuilder: (context, index) {
          final postDetails = posts.posts[index];

          return ListTile(
            leading: CircleAvatar(child: Text(postDetails.id.toString())),
            title: Text(postDetails.title.toString()),
            subtitle: Text(postDetails.body.toString()),
          );
        },
      ),
    );
  }
}
