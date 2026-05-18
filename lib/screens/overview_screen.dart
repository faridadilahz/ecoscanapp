import 'package:flutter/material.dart';
import 'idea_model.dart';
import 'interactive_guide_screen.dart';

class OverviewScreen extends StatelessWidget {
  final DaurUlangIdea idea;

  const OverviewScreen({super.key, required this.idea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Seluruh tubuh konten utama (Bisa di-scroll bebas)
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. AREA HERO IMAGE & TOMBOL KEMBALI
                Stack(
                  children: [
                    Image.network(
                      idea.imageUrl,
                      width: double.infinity,
                      height: 340,
                      fit: BoxFit.cover,
                    ),
                    // Tombol Back Melayang di Pojok Kiri Atas
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 20,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white.withOpacity(0.9),
                          child: const Icon(Icons.arrow_back, color: Color(0xFF27AE60), size: 22),
                        ),
                      ),
                    ),
                  ],
                ),

                // AREA KONTEN UTAMA TEXT & GRID
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 2. HEADLINE INFO (Judul, Kategori, Harga & Durasi)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  idea.title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2E2E2E),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  idea.category,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                idea.price,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E2E2E),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${idea.difficulty} • ${idea.duration}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF27AE60),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // 3. SEKSI DESKRIPSI
                      const Text(
                        "Deskripsi",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E)),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black54, height: 1.5, fontSize: 13),
                          children: [
                            TextSpan(text: idea.description),
                            const TextSpan(
                              text: " Baca selengkapnya",
                              style: TextStyle(color: Color(0xFF27AE60), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 4. SEKSI ALAT DAN BAHAN (Dinamis dari list model)
                      const Text(
                        "Alat dan Bahan",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E)),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: idea.tools.map((toolName) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F8F4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.build_circle_outlined, color: Color(0xFF27AE60), size: 18),
                                const SizedBox(width: 8),
                                Text(
                                  toolName,
                                  style: const TextStyle(fontSize: 13, color: Color(0xFF2E2E2E), fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),

                      // 5. SEKSI VIDEO TUTORIAL
                      const Text(
                        "Video Tutorial",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E)),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: NetworkImage("https://picsum.photos/seed/tutorial/500/300"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF27AE60),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.play_arrow, color: Colors.white, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  "Lihat di Youtube",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 6. SEKSI CARA MEMBUAT (Step-by-step)
                      const Text(
                        "Cara Membuat",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E)),
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: idea.steps.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: const Color(0xFF27AE60).withOpacity(0.1),
                                  child: Text(
                                    "${index + 1}",
                                    style: const TextStyle(color: Color(0xFF27AE60), fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    idea.steps[index],
                                    style: const TextStyle(color: Colors.black, fontSize: 13, height: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 90), // Jarak ganjal ekstra agar konten paling bawah tidak tertutup button melayang
                    ],
                  ),
                )
              ],
            ),
          ),

          // 7. BUTTON STICKY / FLOATING DI BAWAH (Mengunci Posisi)
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF27AE60).withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Berikan aksi navigasi interaktif lanjutan di sini jika diperlukan
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>InteractiveGuideScreen(idea: idea),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27AE60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Mulai panduan interaktif",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.north_east, color: Colors.white, size: 16), // Simbol ikon panah miring ke atas
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}