import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/payment_options.dart';
import 'theme.dart';
import 'screens/home_screen.dart';
import 'screens/food_courts_screen.dart';
import 'screens/restaurants_screen.dart';
import 'screens/food_court_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Court App',
      theme: AppTheme.themeData,
      initialRoute: HomeScreen.routeName,
      routes: {
        '/': (context) => const HomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        FoodCourtsScreen.routeName: (context) => const FoodCourtsScreen(),
        RestaurantsScreen.routeName: (context) => const RestaurantsScreen(),
        PaymentOptionsScreen.routeName: (context) => const PaymentOptionsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == FoodCourtItems.routeName) {
          final name = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => FoodCourtItems(name: name),
          );
        }
        return null;
      },
    );
  }
}