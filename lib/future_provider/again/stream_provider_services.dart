import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderServices {
  Stream<int> showNumbers() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 3));
      yield i;
    }
  }
}

final streamProviderServices = StreamProvider((ref) {
  final service = StreamProviderServices();
  return service.showNumbers();
});
