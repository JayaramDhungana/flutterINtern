import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/item.dart';

class ChangeItemNotifier extends ChangeNotifier {
  List<Item> _items = [];
  List<Item> get item => _items;
  void addItem(String name) {
    debugPrint(name);
    _items = [..._items, Item(id: DateTime.now().toString(), name: name)];
    notifyListeners();
  }

  void deleteItem(String id) {
    _items.removeWhere((item) => item.id == id);
    _items = _items.toList();
    notifyListeners();
  }
}

final changeItemProvider = ChangeNotifierProvider<ChangeItemNotifier>((ref) {
  return ChangeItemNotifier();
});
