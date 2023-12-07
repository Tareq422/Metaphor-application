import 'package:flutter/material.dart';
import 'metaphor_items_page.dart';
import 'borrowed_items_page.dart';
import 'offered_items_page.dart';
import 'item_submission_form.dart';
import 'MetaphorItemsManager.dart';

class MetaphorMasterPage extends StatefulWidget {
  const MetaphorMasterPage({Key? key}) : super(key: key);

  @override
  State<MetaphorMasterPage> createState() => _MetaphorMasterPageState();
}

class _MetaphorMasterPageState extends State<MetaphorMasterPage> {
  final List<Widget> _screens = [
    MetaphorItemsPage(),
    BorrowedItemsPage(),
    OfferedItemsPage(),
  ];
  int _selectedIndex = 0;

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return MetaphorItemsPage();
      case 1:
        return BorrowedItemsPage();
      case 2:
        return OfferedItemsPage();
      case 3:
        return ItemSubmissionForm(onSubmit: _addItemToMetaphorItemsPage);
      default:
        return Container(); // Or any default widget
    }
  }

  // Callback function to add the item to the MetaphorItemsPage
  void _addItemToMetaphorItemsPage(Map<String, dynamic> item) {
    // Assuming 'MetaphorItemsManager' has a method to add the item
    MetaphorItemsManager.addItem(item);

    // Navigate back to the MetaphorItemsPage after submission
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metaphor Application'),
      ),
      body: _getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue, // Color when an item is selected
        unselectedItemColor: Colors.grey, // Color when an item is not selected
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: 'Borrowed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            label: 'Offered',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Submit',
          ),
        ],
      ),
    );
  }
}
