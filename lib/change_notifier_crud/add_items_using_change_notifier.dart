import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/change_notifier_crud/change_item_provider.dart';
import 'package:riverpodproject/change_notifier_crud/change_notifier_homescreen.dart';

class AddItemsUsingChangeNotifier extends ConsumerWidget {
  const AddItemsUsingChangeNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController itemController = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Add Items")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: formkey,
              child: TextFormField(
                controller: itemController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Write Something ';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(label: Text("Add Item")),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState?.validate() ?? false) {
                  ref
                      .read(changeItemProvider.notifier)
                      .addItem(itemController.text);
                  itemController.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierHomescreen(),
                    ),
                  );
                }
              },
              child: Text("Create Items"),
            ),
          ],
        ),
      ),
    );
  }
}
