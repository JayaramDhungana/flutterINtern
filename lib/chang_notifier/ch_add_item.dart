import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/chang_notifier/ch_notifier_provider.dart';

class ChangeNfAddItem extends ConsumerWidget {
  final String category;
  const ChangeNfAddItem({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    final itemsFromChangeNoti = ref.watch(itemProviderChange);
    // Filter items based on the selected category
    final filteredItems =
        itemsFromChangeNoti.items
            .where((item) => item.category == category)
            .toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(label: Text("Item")),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(label: Text("Price")),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              onPressed: () {
                String item = itemNameController.text;
                String price = priceController.text;
                debugPrint("$item,$price,$category");
                ref
                    .read(itemProviderChange.notifier)
                    .addItems(item, price, category);
              },
              child: Text("Create Item"),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final itemss = filteredItems[index];

                  return ListTile(
                    title: Text("Item=${itemss.item}"),
                    subtitle: Text("price=${itemss.price}"),
                    leading: Text("category=${itemss.category}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
