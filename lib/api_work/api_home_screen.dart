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
  List<dynamic> apiData = [];

  Future<void> fetchData() async {
    try {
      var response = await dio.get(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b54cfe8c6cc64318943f514f585588c2",
      );
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        setState(() {
          apiData = response.data['articles'];
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
      appBar: AppBar(centerTitle: true, title: Text("News")),

      body: ListView.builder(
        itemCount: apiData.length,
        itemBuilder: (context, index) {
          final apiDataDetails = apiData[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                apiDataDetails['urlToImage'] ??
                    'https://gizmodo.com/app/uploads/2025/02/GettyImages-2039371693.jpg',
              ),
            ),
            title: Text(apiDataDetails['title']),
            subtitle: Text(
              apiDataDetails['author'] ?? 'No Author Details'.toString(),
            ),
          );
        },
      ),
    );
  }
}
