import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class CategoriesGridScreen extends StatelessWidget {
  const CategoriesGridScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Materials', 'icon': Icons.hardware, 'count': '18 Items', 'color': Colors.blue},
    {'name': 'Structural', 'icon': Icons.foundation, 'count': '6 Items', 'color': Colors.orange},
    {'name': 'Raw Materials', 'icon': Icons.landscape, 'count': '12 Items', 'color': Colors.amber},
    {'name': 'Labor', 'icon': Icons.groups, 'count': '24 Entries', 'color': Colors.green},
    {'name': 'Utilities', 'icon': Icons.plumbing, 'count': '9 Items', 'color': Colors.purple},
    {'name': 'Equipment', 'icon': Icons.precision_manufacturing, 'count': '5 Rentals', 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Categories'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/expenses');
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: (cat['color'] as Color).withValues(alpha: 0.2),
                        child: Icon(cat['icon'], color: cat['color'], size: 30),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        cat['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        cat['count'],
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}