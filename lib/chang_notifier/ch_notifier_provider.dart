import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/chang_notifier/change_noti_model.dart';

class ItemNotifier extends ChangeNotifier {
  List<Items> _items = [];

  List<Items> get items => _items;

  void addItems(String item, String price, String category) {
    _items = [..._items, Items(item: item, price: price, category: category)];
    notifyListeners();
  }
}

final itemProviderChange = ChangeNotifierProvider<ItemNotifier>((ref) {
  return ItemNotifier();
});
