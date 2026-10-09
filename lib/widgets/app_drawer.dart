import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Emmanuel Jogopie',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('jaymax241@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () => Navigator.pushReplacementNamed(context, '/dashboard'),
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Site Expenses'),
            onTap: () => Navigator.pushReplacementNamed(context, '/expenses'),
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Material Categories'),
            onTap: () => Navigator.pushReplacementNamed(context, '/categories'),
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Analytics'),
            onTap: () => Navigator.pushReplacementNamed(context, '/analytics'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Profile'),
            onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}