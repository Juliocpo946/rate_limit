import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainAppShell extends StatefulWidget {
  const MainAppShell({super.key});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Vista Principal' : 'Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar Sesión',
            onPressed: () {
              Provider.of<AuthController>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Principal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
