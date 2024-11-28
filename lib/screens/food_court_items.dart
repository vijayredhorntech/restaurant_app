import 'package:flutter/material.dart';

class FoodCourtItems extends StatefulWidget {
  static const String routeName = '/food-court-items';
  final String name;

  const FoodCourtItems({
    super.key,
    required this.name,
  });

  @override
  State<FoodCourtItems> createState() => _FoodCourtItemsState();
}

class _FoodCourtItemsState extends State<FoodCourtItems> {
  String _selectedFilter = 'all';
  String _selectedCategory = 'All';
  Set<String> _addedItems = {};

  // Sample data for food items
  final List<String> categories = [
    'All',
    'Main Course',
    'Starters',
    'Desserts',
    'Beverages',
    'Snacks'
  ];

  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Butter Chicken',
      'price': 350,
      'isVeg': false,
      'category': 'Main Course',
      'image': 'https://images.unsplash.com/photo-1630748663402-ef49332b3fc2',
    },
    {
      'name': 'Paneer Tikka',
      'price': 250,
      'isVeg': true,
      'category': 'Starters',
      'image': 'https://images.unsplash.com/photo-1630748663402-ef49332b3fc2',
    },
    {
      'name': 'Chocolate Cake',
      'price': 150,
      'isVeg': true,
      'category': 'Desserts',
      'image': 'https://images.unsplash.com/photo-1630748663402-ef49332b3fc2',
    },
    {
      'name': 'Butter Chicken',
      'price': 350,
      'isVeg': false,
      'category': 'Main Course',
      'image': 'https://images.unsplash.com/photo-1630748663402-ef49332b3fc2',
    },
    {
      'name': 'Paneer Tikka',
      'price': 250,
      'isVeg': true,
      'category': 'Starters',
      'image': 'https://images.unsplash.com/photo-1630748663402-ef49332b3fc2',
    },
    {
      'name': 'Chocolate Cake',
      'price': 150,
      'isVeg': true,
      'category': 'Desserts',
      'image': 'https://images.unsplash.com/photo-1630748663402-ef49332b3fc2',
    },
  ];

  void _showCategoryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.restaurant_menu,
                          color: _selectedCategory == categories[index]
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey,
                        ),
                        title: Text(
                          categories[index],
                          style: TextStyle(
                            color: _selectedCategory == categories[index]
                                ? Theme.of(context).colorScheme.primary
                                : Colors.black,
                            fontWeight: _selectedCategory == categories[index]
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedCategory = categories[index];
                          });
                          Navigator.pop(context);
                        },
                        tileColor: _selectedCategory == categories[index]
                            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                            : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddedToCartMessage(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Added to Cart!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Item has been added to your cart',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        elevation: 4,
        margin: const EdgeInsets.only(
          bottom: 20,
          right: 20,
          left: 20,
        ),
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = foodItems.where((item) {
      if (_selectedFilter == 'veg') {
        return item['isVeg'] == true;
      } else if (_selectedFilter == 'nonveg') {
        return item['isVeg'] == false;
      }
      return true;
    }).where((item) {
      if (_selectedCategory == 'All') {
        return true;
      }
      return item['category'] == _selectedCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          // Search Input
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Food Items',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),

          // Filter Buttons and Category
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Category Button
                ElevatedButton.icon(
                  onPressed: _showCategoryDialog,
                  icon: const Icon(Icons.category),
                  label: Text(_selectedCategory),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                // Veg/Non-veg Filters
                Row(
                  children: [
                    FilterChip(
                      label: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('Veg'),
                        ],
                      ),
                      selected: _selectedFilter == 'veg',
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = selected ? 'veg' : 'all';
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor: Colors.green.withOpacity(0.2),
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('Non-Veg'),
                        ],
                      ),
                      selected: _selectedFilter == 'nonveg',
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = selected ? 'nonveg' : 'all';
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor: Colors.red.withOpacity(0.2),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Food Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Veg/Non-Veg Icon and Details
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: item['isVeg'] ? Colors.green : Colors.red,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: item['isVeg'] ? Colors.green : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₹${item['price']}',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Image and Add Button
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['image'],
                              width: 80,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 0),
                          if (!_addedItems.contains(item['name']))
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _addedItems.add(item['name']);
                                });
                                _showAddedToCartMessage(context);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                minimumSize: const Size(80, 30),
                              ),
                              child: const Text('Add'),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}