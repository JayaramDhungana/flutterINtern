import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/home_screen.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/item_provider.dart';

class AddItem extends ConsumerWidget {
  final String forEditItem;
  final String forEditId;

  const AddItem(this.forEditId, this.forEditItem, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController itemController = TextEditingController(
      text: forEditItem,
    );
    final formkey = GlobalKey<FormState>();
    final whichState = ref.watch(descriptionprovider);
    debugPrint(whichState);
    return Scaffold(
      appBar: AppBar(title: Text(whichState)),
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

                decoration: InputDecoration(label: Text(whichState)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState?.validate() ?? false) {
                  final item = itemController.text;
                  debugPrint(item);
                  if (whichState == 'Add Item') {
                    ref.read(itemProvider.notifier).addItem(item);
                    itemController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item creation is successfully done"),
                      ),
                    );
                  } else {
                    ref
                        .read(itemProvider.notifier)
                        .updateItem(forEditId, itemController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Item is Edited Successfully")),
                    );
                  }
                }
              },
              child: Text(whichState),
            ),
          ],
        ),
      ),
    );
  }
}
