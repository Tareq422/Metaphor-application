import 'package:flutter/material.dart';

import '../MetaphorItemsManager.dart';
import 'edit_item_page.dart';

class MetaphorDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;


  const MetaphorDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  item['imageURL'],
                ),
              ),
              Text(
                item['description'],
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    child: ElevatedButton(
                      child: const Text('Action'),
                      onPressed: () {
                        Navigator.pop(context, '${item['name']} action taken');
                      },
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Call the method to remove the item
                        // You need to pass the identifier of the item to be removed
                        MetaphorItemsManager.removeItem(item['name']);

                        // Pop back to the previous screen
                        Navigator.pop(context,'itemDeleted');
                        FocusScope.of(context).unfocus();
                      },
                      child: Text('Remove item'),
                    )
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditItemPage(item: item),
                          ),
                        ).then((updatedItem) {
                          if (updatedItem != null) {
                            // Update the item in the MetaphorItemsManager
                            MetaphorItemsManager.editItem(item['name'], updatedItem);
                            Navigator.pop(context,'itemEdited');
                            // Optionally, update the UI here if needed
                          }
                        });
                      },
                      child: Text('Edit'),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
