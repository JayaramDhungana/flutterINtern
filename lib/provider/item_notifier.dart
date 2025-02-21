import 'package:riverpod/riverpod.dart';
import 'package:riverpodproject/model/item.dart';

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItems(String item, String price, String category) {
    state = [...state, Item(item: item, price: price, category: category)];
  }
}

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});
