import 'package:flutter/material.dart';
import 'metaphor_detail_page.dart';

import 'package:flutter/material.dart';
import 'metaphor_detail_page.dart';
import 'MetaphorItemsManager.dart';

class MetaphorItemsPage extends StatefulWidget {
  const MetaphorItemsPage({Key? key}) : super(key: key);

  @override
  _MetaphorItemsPageState createState() => _MetaphorItemsPageState();
}

class _MetaphorItemsPageState extends State<MetaphorItemsPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children:
          List.generate(MetaphorItemsManager.metaphorItems.length, (index) {
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  MetaphorItemsManager.metaphorItems[index]['imageURL'],
                ),
              ),
              ListTile(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MetaphorDetailPage(
                          item: MetaphorItemsManager.metaphorItems[index]),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(result ?? 'No action taken'),
                      backgroundColor:
                          result == null ? Colors.red : Colors.green,
                    ),
                  );
                },
                title: Text(MetaphorItemsManager.metaphorItems[index]['name']),
                subtitle: Text(
                    '${MetaphorItemsManager.metaphorItems[index]['description']}'),
                trailing: const Icon(Icons.navigate_next),
              ),
            ],
          ),
        );
      }),
    );
  }
}
