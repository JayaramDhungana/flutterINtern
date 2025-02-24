import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderServices {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return "It is From Future Provider";
  }
}

final futureProvider = FutureProvider((ref) {
  final services = ProviderServices();
  return services.fetchData();
});
