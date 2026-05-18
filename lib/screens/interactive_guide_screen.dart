import 'package:flutter/material.dart';
import 'idea_model.dart'; // Pastikan import modelnya

class InteractiveGuideScreen extends StatefulWidget {
  final DaurUlangIdea idea; // 👈 1. Tambahkan variabel penampung data

  // 👈 2. Update constructor untuk menerima data idea
  const InteractiveGuideScreen({super.key, required this.idea}); 

  @override
  State<InteractiveGuideScreen> createState() => _InteractiveGuideScreenState();
}

class _InteractiveGuideScreenState extends State<InteractiveGuideScreen> {
  int _currentPage = 0; 

  @override
  Widget build(BuildContext context) {
    // 👈 3. Ambil data steps langsung dari objek idea yang diklik lewat widget.idea.steps
    final List<String> stepsData = widget.idea.steps;
    bool isSuccessPage = _currentPage == stepsData.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // 👈 MATIKAN DEFAULT BACK BUTTON OTOMATIS JIKA LEADING NYA KOSONG
        automaticallyImplyLeading: false, 
        // 👈 SEMBUNYIKAN TOMBOL KONDISIONAL
        leading: isSuccessPage 
            ? null 
            : IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF27AE60)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      // 👈 4. Oper data stepsData ke method builder bawah
      body: SafeArea(
        child: isSuccessPage ? _buildSuccessContent() : _buildStepContent(stepsData),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xFF27AE60),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded), label: "Pindai"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Eksplor"),
        ],
      ),
    );
  }

  // 👈 5. Sesuaikan method ini agar nerima list steps dinamis
  Widget _buildStepContent(List<String> stepsData) {
    final currentStepDescription = stepsData[_currentPage];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                widget.idea.imageUrl, // Pakai gambar dari model biar dinamis
                height: 220,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 100, color: Colors.grey),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Langkah ${_currentPage + 1}", // Judul otomatis Langkah 1, Langkah 2, dst
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1E1E1E)),
              ),
              const SizedBox(height: 12),
              Text(
                currentStepDescription, // Teks deskripsi langkah dari model lo
                style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        if (_currentPage > 0) {
                          setState(() {
                            _currentPage--;
                          });
                        } else {
                          // 👈 Tambahkan ini biar kalau di Langkah 1 dipencet, dia balik ke screen Overview
                          Navigator.pop(context); 
                        }
                      },
                      icon: const Icon(Icons.arrow_back, size: 16),
                      label: Text(_currentPage == 0 ? "Kembali" : "Sebelumnya"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF27AE60),
                        side: const BorderSide(color: Color(0xFF27AE60)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentPage++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF27AE60),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_currentPage == stepsData.length - 1 ? "Selesai" : "Selanjutnya"),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(stepsData.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: index == _currentPage ? 24 : 8,
                    decoration: BoxDecoration(
                      color: index == _currentPage ? const Color(0xFF27AE60) : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Text(
                "Langkah ${_currentPage + 1} dari ${stepsData.length}",
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    // Cari panjang list data langkah real untuk return balik ke langkah terakhir
    final totalSteps = widget.idea.steps.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(), // 👈 Spacer atas tetap ada agar konten berada di tengah screen
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(color: const Color(0xFF27AE60).withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.celebration_rounded, size: 80, color: Color(0xFF27AE60)),
          ),
          const SizedBox(height: 16),
          const Text("Selamat!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF27AE60))),
          const SizedBox(height: 8),
          Text(
            "Kamu telah mengolah ${widget.idea.title.toLowerCase()} hari ini. Aksimu ini membantu mengurangi sampah dan menjaga keseimbangan lingkungan.",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.grey),
          ),
          
          // 👈 TWEAK DI SINI: Ganti Spacer tengah dengan SizedBox terukur agar deskripsi & tombol lebih rapat
          const SizedBox(height: 32), 
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Selesai", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _currentPage = totalSteps - 1; // Balik ke halaman step paling akhir secara dinamis
              });
            },
            icon: const Icon(Icons.arrow_back, size: 16, color: Colors.grey),
            label: const Text("Kembali ke langkah terakhir", style: TextStyle(color: Colors.grey, fontSize: 14)),
          ),
          const Spacer(), // 👈 Spacer bawah menjaga keseimbangan vertical centering keseluruhan elemen
        ],
      ),
    );
  }
}