import 'package:flutter/material.dart';
import 'package:riverpodproject/chang_notifier/ch_add_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget categoryKoButton(String category) {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.black),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNfAddItem(category: category),
            ),
          );
        },
        child: Text(category),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Item Selection')),
      body: Center(
        child: Column(
          children: [
            categoryKoButton('Food'),
            categoryKoButton('Travel'),
            categoryKoButton('Entertainment'),
          ],
        ),
      ),
    );
  }
}
