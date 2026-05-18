class DaurUlangIdea {
  final String title;
  final String category;
  final String difficulty;
  final String duration;
  final String imageUrl;
  final String price;        // Tambahan field harga estimasi
  final String description;  // Tambahan deskripsi proyek
  final List<String> tools;  // List nama alat & bahan
  final List<String> steps;  // List langkah pembuatan

  DaurUlangIdea({
    required this.title,
    required this.category,
    required this.difficulty,
    required this.duration,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.tools,
    required this.steps,
  });
}

final List<DaurUlangIdea> mockIdeas = [
  DaurUlangIdea(
    title: "Pot Tanaman",
    category: "Botol plastik",
    difficulty: "Mudah",
    duration: "10-15 menit",
    price: "Rp 10.000",
    imageUrl: "https://picsum.photos/seed/pot1/400/300",
    description: "Meowholder adalah tempat pensil dan pot serbaguna berbahan dasar botol plastik bekas yang dirancang menyerupai tubuh mahluk hidup lucu. Desainnya yang minimalis sangat cocok ditaruh di meja belajar atau sudut ruangan.",
    tools: ["Gunting", "Cat Akrilik", "1 Botol Bekas", "Kuas Paint"],
    steps: [
      "Menggambar pola pada botol bekas yang akan kamu buat menggunakan spidol.",
      "Potong botol menggunakan gunting atau cutter mengikuti bentuk lekukan pola yang telah dibuat.",
      "Siapkan cat akrilik, lalu warnai seluruh permukaan botol secara merata sebagai warna dasar.",
      "Gunakan kuas kecil untuk menggambar detail mata, hidung, atau corak estetik lainnya.",
      "Tunggu cat mengering sempurna, dan pot tanaman dari botol bekas siap digunakan!"
    ],
  ),
  DaurUlangIdea(
    title: "Celengan Lucu",
    category: "Botol plastik",
    difficulty: "Mudah",
    duration: "20 menit",
    price: "Rp 5.000",
    imageUrl: "https://picsum.photos/seed/piggy/400/300",
    description: "Ubah botol plastik bekas menjadi celengan lucu pembentuk karakter yang bisa memotivasi kamu atau adik kecil untuk rajin menabung setiap hari.",
    tools: ["Botol Plastik", "Kertas Kado", "Lem Tembak", "Gunting"],
    steps: [
      "Bersihkan botol plastik dari label kemasan luar lalu keringkan.",
      "Buat lubang persegi panjang kecil di bagian tengah badan botol menggunakan cutter untuk tempat memasukkan uang logam/kertas.",
      "Hias botol menggunakan balutan kertas kado atau kain flanel sesuai selera.",
      "Celengan ramah lingkungan siap digunakan di meja kamar lo!"
    ],
  ),
  DaurUlangIdea(
    title: "Kotak Tisu",
    category: "Kardus",
    difficulty: "Sedang",
    duration: "30 menit",
    price: "Rp 15.000",
    imageUrl: "https://picsum.photos/seed/box/400/300",
    description: "Kotak tisu premium yang memanfaatkan limbah kardus tebal di sekitar rumah. Struktur kokoh dengan lapisan kain atau kertas bercorak minimalis.",
    tools: ["Kardus Bekas", "Cutter & Gunting", "Penggaris", "Double Tape"],
    steps: [
      "Ukur dan potong kardus membentuk jaring-jaring balok wadah tisu standar.",
      "Buat lubang elips di bagian atas kardus sebagai tempat penarikan tisu keluar.",
      "Satukan setiap sisi kardus menggunakan perekat double tape atau lem tembak hingga kokoh.",
      "Lapisi dinding luar kardus dengan kertas dekoratif agar terlihat rapi dan estetik."
    ],
  ),
  DaurUlangIdea(
    title: "Lampion Estetik",
    category: "Kertas",
    difficulty: "Susah",
    duration: "45 menit",
    price: "Rp 25.000",
    imageUrl: "https://picsum.photos/seed/lamp/400/300",
    description: "Kerajinan tangan tingkat lanjut yang mengubah kertas bekas atau koran menjadi lampion gantung berpola geometris. Memberikan efek pendaran cahaya yang hangat.",
    tools: ["Kertas Tebal", "Lampu LED Kecil", "Lem Kertas", "Gunting"],
    steps: [
      "Lipat kertas membentuk modul-modul geometris kecil terlebih dahulu.",
      "Rangkai susunan modul kertas hingga membentuk struktur bola atau tabung berongga.",
      "Pasang dudukan lampu kecil beserta kabel/baterai di bagian dalam rongga kertas.",
      "Gantung lampion di sudut kamar dan nyalakan saklar lampu untuk menikmati suasananya."
    ],
  ),
];