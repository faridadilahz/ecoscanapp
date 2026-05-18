import 'package:flutter/material.dart';
import 'package:ecoscan/screens/main_navigation.dart'; // Import file navigasi induk baru kita

void main() {
  runApp(const EcoScanApp());
}

class EcoScanApp extends StatelessWidget {
  const EcoScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoScan',
      debugShowCheckedModeBanner: false, // Ngilangin banner "debug" di pojok kanan
      theme: ThemeData(
        primarySwatch: Colors.green,
        // Tetap mempertahankan font family default sesuai desain Figma lo
        fontFamily: 'Bricolage-Grotesque', 
        useMaterial3: true, // Pake style Material 3 yang lebih modern
      ),
      home: const MainNavigation(), // DIUBAH KE SINI: Pindah ke wrapper navigasi utama
    );
  }
}