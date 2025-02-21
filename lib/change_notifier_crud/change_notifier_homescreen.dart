import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/change_notifier_crud/add_items_using_change_notifier.dart';
import 'package:riverpodproject/change_notifier_crud/change_item_provider.dart';

class ChangeNotifierHomescreen extends ConsumerWidget {
  const ChangeNotifierHomescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(changeItemProvider).item;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Items using Change Notifier "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemsUsingChangeNotifier(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final itemDetails = items[index];
          return ListTile(
            leading: CircleAvatar(child: Text("${(index + 1).toString()}")),
            title: Text(itemDetails.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit),
                IconButton(
                  onPressed: () {
                    ref.read(changeItemProvider).deleteItem(itemDetails.id);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
