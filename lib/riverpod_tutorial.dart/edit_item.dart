import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/home_screen.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/item_provider.dart';

class EditItem extends ConsumerWidget {
  final String idOfItem;
  final String itemDetail;
  const EditItem(this.idOfItem, this.itemDetail, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController itemController = TextEditingController(
      text: itemDetail,
    );

    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text("Edit Item")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formkey,

              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Something';
                  } else {
                    return null;
                  }
                },
                controller: itemController,

                decoration: InputDecoration(label: Text("Edit Item")),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState?.validate() ?? false) {
                  final item = itemController.text;
                  debugPrint(item);
                  ref.read(itemProvider.notifier).updateItem(idOfItem, item);
                  itemController.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Item is successfully edited")),
                  );
                }
              },
              child: Text("Edit Item"),
            ),
          ],
        ),
      ),
    );
  }
}
