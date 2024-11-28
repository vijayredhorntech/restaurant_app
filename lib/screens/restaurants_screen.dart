import 'package:flutter/material.dart';

class RestaurantsScreen extends StatelessWidget {
  static const String routeName = '/restaurants';

  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      body: const Center(
        child: Text(
          'Restaurants Screen Coming Soon',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}