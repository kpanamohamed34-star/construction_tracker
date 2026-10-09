import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Site Budget Analytics'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Budget Utilization',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Spent: \$14,250', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Target: \$20,000', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const LinearProgressIndicator(
                        value: 0.71, // 71% spent
                        minHeight: 12,
                        backgroundColor: Colors.grey,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('71.25% of total allocated budget used', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Category Breakdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildCategoryRow('Materials & Cement', '\$6,450', 0.45, Colors.blue),
            _buildCategoryRow('Structural Steel', '\$4,200', 0.29, Colors.orange),
            _buildCategoryRow('Site Labor Wages', '\$2,300', 0.16, Colors.green),
            _buildCategoryRow('Utilities & Piping', '\$1,300', 0.10, Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(String title, String amount, double ratio, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Icon(Icons.pie_chart, color: color, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: LinearProgressIndicator(value: ratio, color: color, backgroundColor: Colors.grey.shade200),
        trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}