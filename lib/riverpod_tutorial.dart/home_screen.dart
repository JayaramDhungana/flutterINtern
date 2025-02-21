import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/add_item.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/edit_item.dart';
import 'package:riverpodproject/riverpod_tutorial.dart/item_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Learning Riverpod"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItem('', '')),
          );
          ref.read(descriptionProvider.notifier).addItemCome('Add Item');
          // ref.read(itemProvider.notifier).addItem("New Item");
        },
        child: Icon(Icons.add),
      ),
      body:
          item.isEmpty
              ? Center(child: Text("No data found"))
              : ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final itemDetail = item[index];
                  return ListTile(
                    title: Text(itemDetail.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        AddItem(itemDetail.id, itemDetail.name),

                                // (context) => EditItem(
                                //   itemDetail.id,
                                //   itemDetail.name,
                                // ),
                              ),
                            );
                            ref
                                .read(descriptionProvider.notifier)
                                .editItemCome("Edit Item");
                            // ref.read(itemProvider.notifier).updateItem(itemDetail.id, 'updated name');
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Do you Want to Delete This Item",
                                  ),

                                  actions: [
                                    TextButton(
                                      onPressed: Navigator.of(context).pop,
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(itemProvider.notifier)
                                            .deleteItem(itemDetail.id);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Item Deleted Successfully",
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text("Confirm"),
                                    ),
                                  ],
                                );
                              },
                            );
                            // ref
                            //     .read(itemProvider.notifier)
                            //     .deleteItem(itemDetail.id);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     backgroundColor: Colors.red,
                            //     content: Text("Item deleted Successfully"),
                            //   ),
                            // );
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
