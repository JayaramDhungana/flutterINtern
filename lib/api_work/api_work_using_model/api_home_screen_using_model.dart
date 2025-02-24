import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpodproject/api_work/api_work_using_model/news_article.dart';

class ApiHomeScreenUsingModel extends StatefulWidget {
  const ApiHomeScreenUsingModel({super.key});

  @override
  State<ApiHomeScreenUsingModel> createState() =>
      _ApiHomeScreenUsingModelState();
}

class _ApiHomeScreenUsingModelState extends State<ApiHomeScreenUsingModel> {
  //instance of Dio Banauna Parxa
  Dio dio = Dio();
  List<NewsArticle> apiData = [];

  Future<void> fetchData() async {
    try {
      final uri =
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b54cfe8c6cc64318943f514f585588c2";
      final response = await dio.get(uri);
      if (response.statusCode == 200) {
        setState(() {
          apiData =
              (response.data['articles'] as List)
                  .map((a) => NewsArticle.fromJson(a))
                  .toList();
        });
      }
    } catch (e) {
      debugPrint("Not Successs because $e");
    }
  }

  //initState
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("News")),

      body: ListView.builder(
        itemCount: apiData.length,
        itemBuilder: (context, index) {
          final apiDetails = apiData[index];
          return ListTile(
            title: Text(apiDetails.title ?? "Title is Missing"),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                apiDetails.urlToImage ??
                    'https://gizmodo.com/app/uploads/2025/02/GettyImages-2039371693.jpg',
              ),
            ),
            subtitle: Text(
              "(${apiDetails.publishedAt ?? " No Pubslished date"})           ${apiDetails.author ?? "No Author"}",
            ),
          );
        },
      ),
    );
  }
}
