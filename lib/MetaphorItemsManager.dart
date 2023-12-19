class MetaphorItemsManager {
  static List<Map<String, dynamic>> metaphorItems = [
    {
      'name': 'Metaphor Item 1',
      'description': 'Description for Metaphor Item 1',
      'imageURL': 'https://static.scientificamerican.com/sciam/cache/file/1DDFE633-2B85-468D-B28D05ADAE7D1AD8_source.jpg?w=590&h=800&D80F3D79-4382-49FA-BE4B4D0C62A5C3ED',
    },
    {
      'name': 'Metaphor Item 2',
      'description': 'Description for Metaphor Item 2',
      'imageURL': 'https://static.scientificamerican.com/sciam/cache/file/1DDFE633-2B85-468D-B28D05ADAE7D1AD8_source.jpg?w=590&h=800&D80F3D79-4382-49FA-BE4B4D0C62A5C3ED',
    },
    // Add more items
  ];

  static void addItem(Map<String, dynamic> item) {
    metaphorItems.add(item);
  }

  static void removeItem(String itemName) {
    metaphorItems.removeWhere((item) => item['name'] == itemName);
  }

  static void editItem(String originalItemName, Map<String, dynamic> updatedItem) {
    int index = metaphorItems.indexWhere((item) => item['name'] == originalItemName);
    if (index != -1) {
      metaphorItems[index] = updatedItem;
    }
  }

}
