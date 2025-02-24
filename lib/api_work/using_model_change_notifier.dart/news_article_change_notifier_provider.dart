import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/api_work_using_model/News_article.dart';

class NewsArticleNotifier extends ChangeNotifier {
  Dio dio = Dio();
  List<NewsArticle> newsArticles = [];
  String error = ''; // This will store error messages

  // Fetch news articles from API
  Future<void> fetchNewsArticle() async {
    try {
      final uri =
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b54cfe8c6cc64318943f514f585588c2";
      final response = await dio.get(uri);

      if (response.statusCode == 200) {
        newsArticles =
            (response.data['articles'] as List)
                .map((a) => NewsArticle.fromJson(a))
                .toList();
        error = ''; // Clear error if the request is successful
      } else {
        error = 'Failed to load articles';
      }
    } catch (e) {
      error = 'Error: $e'; // Set error message if exception occurs
    }

    notifyListeners(); // Notify listeners to update the UI
  }
}

// Create a provider for the NewsArticleNotifier
final newsArticleProvider = ChangeNotifierProvider<NewsArticleNotifier>((ref) {
  return NewsArticleNotifier();
});
