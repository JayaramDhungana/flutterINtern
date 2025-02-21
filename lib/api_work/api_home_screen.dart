import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen({super.key});

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  //instance of Dio banayeko
  Dio dio = Dio();
  Map<String, dynamic> apiData = {};

  Future<void> fetchData() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b54cfe8c6cc64318943f514f585588c2",
      );
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        setState(() {
          apiData = response.data['articles'][0];
        });
      }
    } catch (e) {
      debugPrint("Not Success because $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${apiData['author']}  ${apiData.length}")),
      body: ListTile(
        focusColor: Colors.amber,
        onTap: () {
          debugPrint(apiData['url']);
        },
        title: Text("${apiData['title']}  \t "),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(apiData['urlToImage']),
        ),
        subtitle: Text(
          "${apiData['description']}/n ${apiData['content']}  ${apiData['publishedAt']}",
        ),
        trailing: Text("${apiData['source']['name']} "),
      ),
    );
  }
}
