import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/api_work_using_model/news_article.dart';

// Define a state class to manage the state of your API data
class NewsArticleState {
  final List<NewsArticle> newsArticles;
  final String error;

  NewsArticleState({this.newsArticles = const [], this.error = ''});

  NewsArticleState copyWith({List<NewsArticle>? newsArticles, String? error}) {
    return NewsArticleState(
      newsArticles: newsArticles ?? this.newsArticles,
      error: error ?? this.error,
    );
  }
}

// Create a StateNotifier to handle the fetching logic
class NewsArticleNotifier extends StateNotifier<NewsArticleState> {
  //dio ko instance chai banauna parxa
  final Dio dio;

  NewsArticleNotifier(this.dio) : super(NewsArticleState());

  Future<void> fetchNewsArticles() async {
    try {
      final uri =
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b54cfe8c6cc64318943f514f585588c2";
      final response = await dio.get(uri);

      if (response.statusCode == 200) {
        final articles =
            (response.data['articles'] as List)
                .map((a) => NewsArticle.fromJson(a))
                .toList();
        state = state.copyWith(newsArticles: articles);
      } else {
        state = state.copyWith(error: 'Failed to load articles');
      }
    } catch (e) {
      state = state.copyWith(error: 'Not Success because $e');
    }
  }
}

// Create a provider for the NewsArticleNotifier
final newsArticleProvider =
    StateNotifierProvider<NewsArticleNotifier, NewsArticleState>((ref) {
      return NewsArticleNotifier(Dio());
    });
