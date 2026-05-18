import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'explore_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // Daftar halaman navigasi EcoScan kamu
  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Halaman Pindai (Belum Dibuat)")),
    const ExploreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF27AE60),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // Biar posisi tab presisi anteng
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Ganti halaman pas diklik
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: "Pindai",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Eksplor",
          ),
        ],
      ),
    );
  }
}