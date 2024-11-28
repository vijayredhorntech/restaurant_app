import 'package:flutter/material.dart';
import 'food_court_items.dart';

class FoodCourtsScreen extends StatelessWidget {
  static const String routeName = '/food-courts';

  const FoodCourtsScreen({super.key});

  // Sample data for food courts
  static const List<Map<String, String>> foodCourts = [
    {
      'name': 'City Center Food Court',
      'address': '123 Main Street, Downtown',
      'distance': '4.58',
      'image': 'https://images.unsplash.com/photo-1678028206509-70fa448f934c',
    },
    {
      'name': 'Metro Mall Food Hub',
      'address': '456 Park Avenue, West Side',
      'distance': '5.2',
      'image': 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
    },
    {
      'name': 'Gourmet Gallery',
      'address': '789 Food Street, East End',
      'distance': '3.8',
      'image': 'https://images.unsplash.com/photo-1504754524776-8f4f37790ca0',
    },
    {
      'name': 'City Center Food Court',
      'address': '123 Main Street, Downtown',
      'distance': '4.58',
      'image': 'https://images.unsplash.com/photo-1678028206509-70fa448f934c',
    },
    {
      'name': 'Metro Mall Food Hub',
      'address': '456 Park Avenue, West Side',
      'distance': '5.2',
      'image': 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601',
    },
    {
      'name': 'Gourmet Gallery',
      'address': '789 Food Street, East End',
      'distance': '3.8',
      'image': 'https://images.unsplash.com/photo-1504754524776-8f4f37790ca0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Courts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
            child: Text(
              'Food Courts Near You',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          // Search Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search within food courts',
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

          // Food Courts List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: foodCourts.length,
              itemBuilder: (context, index) {
                return FoodCourtCard(
                  name: foodCourts[index]['name']!,
                  address: foodCourts[index]['address']!,
                  distance: foodCourts[index]['distance']!,
                  image: foodCourts[index]['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodCourtCard extends StatelessWidget {
  final String name;
  final String address;
  final String distance;
  final String image;

  const FoodCourtCard({
    super.key,
    required this.name,
    required this.address,
    required this.distance,
    required this.image,
  });

  void _showFavoriteMessage(BuildContext context) {
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
                    Icons.favorite,
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
                      'Added to Favorites!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'You can find this in your favorites list',
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          FoodCourtItems.routeName,
          arguments: name,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Card Content
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food Court Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                // Food Court Details
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          address,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$distance kms Away',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Favorite Button
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () => _showFavoriteMessage(context),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}