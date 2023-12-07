import 'package:flutter/material.dart';

class ItemSubmissionForm extends StatefulWidget {
  final Function(Map<String, dynamic> item) onSubmit;

  const ItemSubmissionForm({Key? key, required this.onSubmit})
      : super(key: key);

  @override
  _ItemSubmissionFormState createState() => _ItemSubmissionFormState();
}

class _ItemSubmissionFormState extends State<ItemSubmissionForm> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageURLController = TextEditingController();

  void _submitForm() {
    // Get the form data
    Map<String, dynamic> itemData = {
      'name': itemNameController.text,
      'description': descriptionController.text,
      'imageURL': imageURLController.text,
      // Add any other fields you have
    };

    // Pass the item data to the callback function
    widget.onSubmit(itemData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Submission'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: itemNameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageURLController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
