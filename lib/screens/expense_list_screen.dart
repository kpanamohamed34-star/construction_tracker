import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  // Mock list of construction site expenses
  final List<Map<String, String>> expenses = const [
    {'title': '50 Bags of Cement', 'category': 'Materials', 'cost': '\$450', 'date': '15 Oct 2026', 'vendor': 'City Hardware'},
    {'title': 'Steel Rebar 12mm', 'category': 'Structural', 'cost': '\$1,200', 'date': '14 Oct 2026', 'vendor': 'Sierra Steel Co.'},
    {'title': 'Sand Delivery (2 Trucks)', 'category': 'Raw Materials', 'cost': '\$300', 'date': '12 Oct 2026', 'vendor': 'Quarry Services'},
    {'title': 'Site Worker Daily Wages', 'category': 'Labor', 'cost': '\$650', 'date': '10 Oct 2026', 'vendor': 'On-site Crew'},
    {'title': 'Plumbing Fittings & Pipes', 'category': 'Utilities', 'cost': '\$280', 'date': '08 Oct 2026', 'vendor': 'Apex Supplies'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Site Expense List'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final item = expenses[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.receipt, color: Colors.white),
              ),
              title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${item['category']} • ${item['date']}'),
              trailing: Text(
                item['cost']!,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16),
              ),
              onTap: () {
                // Pass data to ExpenseDetailScreen via named route arguments
                Navigator.pushNamed(context, '/expense-detail', arguments: item);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-expense'),
        child: const Icon(Icons.add),
      ),
    );
  }
}