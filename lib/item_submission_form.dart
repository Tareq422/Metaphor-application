import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? pickedImage; // Store picked image

  void _submitForm() {
    // Get the form data
    Map<String, dynamic> itemData = {
      'name': itemNameController.text,
      'description': descriptionController.text,
      'image': pickedImage?.path, // Include chosen image path if any
    };

    // Validate all fields are filled
    if (itemNameController.text.isEmpty || pickedImage == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Missing Information'),
          content: Text('Please enter both item name and choose an image.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        pickedImage = pickedFile;
                      });
                    }
                  },
                  child: Text('Choose Image'),
                ),
                SizedBox(width: 16),
                if (pickedImage != null)
                  Image.network(pickedImage!.path)
              ],
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
