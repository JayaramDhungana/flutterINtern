import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/placeholder_api_work/posts.dart';

class PostChangeNotifier extends ChangeNotifier {
  Dio dio = Dio();
  List<Posts> apiPosts = [];
  String error = '';

  Future<void> fetchPosts() async {
    try {
      final uri = "https://jsonplaceholder.typicode.com/posts";
      final response = await dio.get(uri);
      // debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        // apiPosts =
        //     (response.data as List).map((a) => Posts.fromJson(a)).toList();
        apiPosts =
            (response.data as List).map((a) => Posts.fromJson(a)).toList();
        debugPrint("It is Successfull");
      } else {
        debugPrint("It is Unsuccessfull");
        error = "Unable to find data";
      }
    } catch (e) {
      debugPrint("Error is $e");
      error = "Error is $e";
    }
    notifyListeners();
  }
}

final postChangeNotifierProvider = ChangeNotifierProvider<PostChangeNotifier>((
  ref,
) {
  return PostChangeNotifier();
});
