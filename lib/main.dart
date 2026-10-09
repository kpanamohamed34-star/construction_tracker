import 'package:flutter/material.dart';

// Import all screens
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/expense_list_screen.dart';
import 'screens/expense_detail_screen.dart';
import 'screens/add_expense_screen.dart';
import 'screens/categories_grid_screen.dart';
import 'screens/analytics_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const ConstructionTrackerApp());
}

class ConstructionTrackerApp extends StatelessWidget {
  const ConstructionTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Construction Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Initial Route
      initialRoute: '/',
      // Named Routes map
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/expenses': (context) => const ExpenseListScreen(),
        '/expense-detail': (context) => const ExpenseDetailScreen(),
        '/add-expense': (context) => const AddExpenseScreen(),
        '/categories': (context) => const CategoriesGridScreen(),
        '/analytics': (context) => const AnalyticsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}