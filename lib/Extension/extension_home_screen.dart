import 'package:flutter/material.dart';

// Extension on BuildContext to simplify commonly used functionalities
extension ContextExtensions on BuildContext {
  // Extension to get the screen height
  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  // Extension to get the screen width
  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  // Extension to get the current theme's primary color
  Color get primaryColor {
    return Theme.of(this).primaryColor;
  }
}

class ExtensionHomeScreen extends StatelessWidget {
  const ExtensionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using extension methods in the build method
    double height = context.screenHeight;
    double width = context.screenWidth;
    Color primaryColor = context.primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'), backgroundColor: primaryColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Screen Height: $height\nScreen Width: $width',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
