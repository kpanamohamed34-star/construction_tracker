import 'package:flutter/material.dart';

class ExpenseDetailScreen extends StatelessWidget {
  const ExpenseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract argument passed from ExpenseListScreen
    final expense = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {
      'title': 'Construction Expense',
      'category': 'General',
      'cost': '\$0.00',
      'date': 'N/A',
      'vendor': 'Unknown Vendor'
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(expense['title']!),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.receipt_long, size: 60, color: Colors.blue),
                      const SizedBox(height: 10),
                      Text(
                        expense['cost']!,
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        expense['title']!,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 32),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Category'),
                  subtitle: Text(expense['category']!),
                ),
                ListTile(
                  leading: const Icon(Icons.store),
                  title: const Text('Supplier / Vendor'),
                  subtitle: Text(expense['vendor']!),
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Transaction Date'),
                  subtitle: Text(expense['date']!),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back to Expenses'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}