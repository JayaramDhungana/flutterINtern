import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/placeholder_api_work/using_change_notifier/post_cange_notifier_provider.dart';

class HomeScreenForPostsChangeNotifier extends ConsumerStatefulWidget {
  const HomeScreenForPostsChangeNotifier({super.key});

  @override
  ConsumerState<HomeScreenForPostsChangeNotifier> createState() =>
      _HomeScreenForPostsChangeNotifierState();
}

class _HomeScreenForPostsChangeNotifierState
    extends ConsumerState<HomeScreenForPostsChangeNotifier> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(postChangeNotifierProvider).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Posts using Change Notifier"),
      ),

      body: ListView.builder(
        itemCount: posts.apiPosts.length,
        itemBuilder: (context, index) {
          final postDetails = posts.apiPosts[index];
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
