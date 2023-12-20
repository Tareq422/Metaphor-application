import 'package:flutter/material.dart';
import '../MetaphorItemsManager.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> uniqueActionedItems = MetaphorItemsManager.metaphorItems
        .where((item) => item['isActioned'] ?? false)
        .toSet()
        .toList(); // Remove duplicates based on item equality

    return Scaffold(
      appBar: AppBar(title: const Text('Basket')),
      body: ListView.builder(
        itemCount: uniqueActionedItems.length,
        itemBuilder: (context, index) {
          final item = uniqueActionedItems[index];
          return Dismissible(
            key: Key(item['name']), // Essential for Dismissible to work correctly
            onDismissed: (direction) {
              // Instead of removing the item entirely, mark it as not actioned
              MetaphorItemsManager.setItemActioned(item['name'], false);
              setState(() {
                // Update the state to reflect the removal from the basket
                uniqueActionedItems.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item['name']} removed from basket'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Add logic to undo the removal if needed (mark as actioned again)
                    },
                  ),
                ),
              );
            },
            background: Container(color: Colors.red),
            child: ListTile(
              leading: Image.network(item['imageURL']),
              title: Text(item['name']),
              subtitle: Text(item['description']),
              // trailing: IconButton(
              //   icon: Icon(Icons.edit),
              //   onPressed: () {
              //     // Handle item editing
              //   },
              // ),
            ),
          );
        },
      ),
    );
  }
}
