import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/api_work_using_model/news_article.dart';
import 'package:riverpodproject/api_work/api_work_using_model_provider/news_article_provider.dart';

class ApiHomeScreenUsingModelProvider extends ConsumerStatefulWidget {
  const ApiHomeScreenUsingModelProvider({super.key});

  @override
  ConsumerState<ApiHomeScreenUsingModelProvider> createState() =>
      _ApiHomeScreenUsingModelProviderState();
}

class _ApiHomeScreenUsingModelProviderState
    extends ConsumerState<ApiHomeScreenUsingModelProvider> {
  @override
  void initState() {
    super.initState();
    // Trigger the fetchNewsArticles method when the screen is initialized
    ref.read(newsArticleProvider.notifier).fetchNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the state of the newsArticleProvider
    final newsArticleState = ref.watch(newsArticleProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News using State Notifier"),
      ),
      body:
          newsArticleState.error.isNotEmpty
              ? Center(child: Text(newsArticleState.error))
              : newsArticleState.newsArticles.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: newsArticleState.newsArticles.length,
                itemBuilder: (context, index) {
                  final apiDetails = newsArticleState.newsArticles[index];
                  return ListTile(
                    title: Text(apiDetails.title ?? "Title is Missing"),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        apiDetails.urlToImage ??
                            'https://gizmodo.com/app/uploads/2025/02/GettyImages-2039371693.jpg',
                      ),
                    ),
                    subtitle: Text(
                      "(${apiDetails.publishedAt ?? " No Published date"}) ${apiDetails.author ?? "No Author"}",
                    ),
                  );
                },
              ),
    );
  }
}
