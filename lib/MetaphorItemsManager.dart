class MetaphorItemsManager {
  static List<Map<String, dynamic>> metaphorItems = [
    {
      'name': 'Metaphor Item 1',
      'description': 'Description for Metaphor Item 1',
      'imageURL': 'https://example.com/item1.jpg',
    },
    {
      'name': 'Metaphor Item 2',
      'description': 'Description for Metaphor Item 2',
      'imageURL': 'https://example.com/item2.jpg',
    },
    // Add more items
  ];

  static void addItem(Map<String, dynamic> item) {
    metaphorItems.add(item);
  }
}
