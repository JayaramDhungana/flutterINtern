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

class StreamProviderServices {
  Stream<int> showNumbers() async* {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }
}

final streamProvider = StreamProvider((r) {
  final services = StreamProviderServices();
  return services.showNumbers();
});
