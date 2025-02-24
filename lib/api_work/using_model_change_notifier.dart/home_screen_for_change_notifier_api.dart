import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/api_work/api_work_using_model/News_article.dart';
import 'package:riverpodproject/api_work/using_model_change_notifier.dart/news_article_change_notifier_provider.dart';
import 'package:riverpodproject/change_notifier_crud/change_item_provider.dart';

class ApiHomeScreenUsingModelProviderChange extends ConsumerStatefulWidget {
  const ApiHomeScreenUsingModelProviderChange({super.key});

  @override
  ConsumerState<ApiHomeScreenUsingModelProviderChange> createState() =>
      _ApiHomeScreenUsingModelProviderChangeState();
}

class _ApiHomeScreenUsingModelProviderChangeState
    extends ConsumerState<ApiHomeScreenUsingModelProviderChange> {
  @override
  void initState() {
    super.initState();
    // Trigger the fetchNewsArticle() function when the screen loads.
    ref.read(newsArticleProvider).fetchNewsArticle();
  }

  @override
  Widget build(BuildContext context) {
    // Watching the newsArticleProvider to get the state
    final newsArticleNotifier = ref.watch(newsArticleProvider);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("News")),
      body:
          newsArticleNotifier.error.isNotEmpty
              ? Center(
                child: Text(newsArticleNotifier.error),
              ) // Show error message if any
              : newsArticleNotifier.newsArticles.isEmpty
              ? Center(
                child: CircularProgressIndicator(),
              ) // Show loading indicator if no data
              : ListView.builder(
                itemCount: newsArticleNotifier.newsArticles.length,
                itemBuilder: (context, index) {
                  final apiDetails = newsArticleNotifier.newsArticles[index];
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
