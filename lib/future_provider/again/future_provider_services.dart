import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderServices {
  Future<String> showText() async {
    await Future.delayed(Duration(seconds: 3));
    return "This string is from the future Provider with delayed";
  }
}

final futureProviderServices = FutureProvider((ref) {
  final services = FutureProviderServices();
  return services.showText();
});
