import 'package:flutter/material.dart';
import 'package:tuban_health/pages/facility/health_service_page.dart';
import 'package:tuban_health/pages/map/map_page.dart';
import 'package:tuban_health/pages/saved/saved_page.dart';
import 'package:tuban_health/theme/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const HealthServicePage(),
    const MapPage(),
    const SavedPage(),
  ];

  int _selectedIndex = 0;

  void _bottomNavBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _bottomNavBar,
        selectedItemColor: Styles.primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_repair_service_outlined),label: "Layanan"),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined),label: "Maps"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_add_outlined), label: "Tersimpan"),
        ],
      ),
    );
  }
}
