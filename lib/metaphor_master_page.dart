import 'dart:html';

import 'package:flutter/material.dart';
import 'metaphor_items_page.dart';
import 'search_page.dart';
import 'offered_items_page.dart';
import 'item_submission_form.dart';
import 'MetaphorItemsManager.dart';

class MetaphorMasterPage extends StatefulWidget {
  const MetaphorMasterPage({Key? key}) : super(key: key);

  @override
  State<MetaphorMasterPage> createState() => _MetaphorMasterPageState();
}

class _MetaphorMasterPageState extends State<MetaphorMasterPage> {
  final List<BottomNavItem> items = [
    // Replace these with your actual items and icons
    BottomNavItem(icon: Icons.home, text: 'Home', routeName: 'home'),
    BottomNavItem(icon: Icons.search, text: 'Search', routeName: '/search'),
    BottomNavItem(icon: Icons.add, text: 'Add', routeName: '/add'),
    BottomNavItem(icon: Icons.share, text: 'Offered', routeName: '/offered'),
    BottomNavItem(icon: Icons.person, text: 'Profile', routeName: '/profile'),

  ];

  // int _selectedIndex = 0;
  //
  // Widget _getScreen(int index) {
  //   switch (index) {
  //     case 0:
  //       return MetaphorItemsPage();
  //     case 1:
  //       return BorrowedItemsPage();
  //     case 2:
  //       return OfferedItemsPage();
  //     case 3:
  //       return ItemSubmissionForm(onSubmit: _addItemToMetaphorItemsPage);
  //     default:
  //       return Container(); // Or any default widget
  //   }
  // }

  // // Callback function to add the item to the MetaphorItemsPage
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
        title: Text('Your App Title'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MetaphorItemsPage(), // Replace this with your actual home page
          SearchPage(),
          ItemSubmissionForm(onSubmit: _addItemToMetaphorItemsPage),// Replace this with your actual about page
          // Replace this with your actual settings page
          OfferedItemsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: items.map((item) => BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.text,
        )).toList(),
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  int _selectedIndex = 0; // Tracks the currently selected bottom navigation item
}

class BottomNavItem {
  final IconData icon;
  final String text;
  final String routeName;

  BottomNavItem({required this.icon, required this.text, required this.routeName});
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('This is your profile page'));
  }
}
