import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9), // Background putih kehijauan soft
      body: SafeArea(
        child: Stack(
          children: [
            // Background Aksesoris
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE8F5E9).withOpacity(0.5),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // App Bar Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.menu, color: Colors.green[800]),
                          const SizedBox(width: 15),
                          Icon(
                            Icons.help_outline,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[600]),
                          const SizedBox(width: 15),
                          const CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFFE57373), // Warna merah avatar
                            child: Text(
                              'S',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                  // Header Greeting
                  const Text(
                    "Halo! 👋",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E2E2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Ayo ubah barang bekas\nbeserta sampah menjadi\nsebuah peluang yang\nbermanfaat ✨",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black38,
                      height: 1.3,
                      fontWeight: FontWeight.w200,
                    ),
                  ),

                  const SizedBox(height: 172),

                  // Tombol Pindai Sekarang (Green Card)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF27AE60), // Hijau EcoScan
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Pindai Sekarang",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Lihat nilai dan ide kreatif barangmu.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tombol Cari Ide (Outline Card)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFF27AE60).withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Color(0xFF27AE60),
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Cari Ide Daur Ulang",
                          style: TextStyle(
                            color: Color(0xFF27AE60),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Lihat berbagai ide dan inspirasi.",
                          style: TextStyle(color: Colors.black26, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}