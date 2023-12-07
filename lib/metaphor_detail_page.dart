import 'package:flutter/material.dart';

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
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Action'),
                  onPressed: () {
                    Navigator.pop(context, '${item['name']} action taken');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
