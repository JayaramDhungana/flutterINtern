import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/placeholder_api_work/posts.dart';

class PostState {
  final List<Posts> posts;
  final String error;

  PostState({this.posts = const [], this.error = ''});

  PostState copyWith({List<Posts>? posts, String? error}) {
    return PostState(posts: posts ?? this.posts, error: error ?? this.error);
  }
}

class PostStateNotifer extends StateNotifier<PostState> {
  Dio dio = Dio();
  PostStateNotifer(this.dio) : super(PostState());

  Future<void> fetchPosts() async {
    try {
      final uri = "https://jsonplaceholder.typicode.com/posts";
      final response = await dio.get(uri);
      if (response.statusCode == 200) {
        final posts =
            (response.data as List).map((a) => Posts.fromJson(a)).toList();
        state = state.copyWith(posts: posts);
      } else {
        state = state.copyWith(error: "No success");
      }
    } catch (e) {
      state = state.copyWith(error: "$e");
    }
  }
}

final postNotifierProvider = StateNotifierProvider<PostStateNotifer, PostState>(
  (ref) {
    return PostStateNotifer(Dio());
  },
);
