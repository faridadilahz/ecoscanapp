import 'package:flutter/material.dart';
import 'idea_model.dart';
import 'overview_screen.dart'; // Pastikan mengimport file overview yang baru nanti

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedCategory = "Semua";
  final List<String> categories = ["Semua", "Botol", "Plastik", "Kertas"];
  
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredIdeas = mockIdeas.where((idea) {
      final matchesCategory = selectedCategory == "Semua" || 
          idea.category.toLowerCase().contains(selectedCategory.toLowerCase());
      
      final matchesSearch = _searchQuery.isEmpty || 
          idea.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          idea.category.toLowerCase().contains(_searchQuery.toLowerCase());
          
      return matchesCategory && matchesSearch;
    }).toList();

    bool isSearching = _searchQuery.isNotEmpty;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ==========================================
            // 1. AREA HEADER ATAS, SEARCH BAR, & KATEGORI
            // ==========================================
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // HEADER UTAMA
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Temukan Ide Kreatif",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E2E2E),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0), 
                              child: Icon(
                                Icons.qr_code_scanner, 
                                color: Colors.green[600], 
                                size: 28,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),

                        // SEARCH BAR & FILTER BUTTON
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    isSearching
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _searchController.clear();
                                                _searchQuery = "";
                                              });
                                            },
                                            child: const Icon(Icons.arrow_back, color: Color(0xFF27AE60), size: 20),
                                          )
                                        : const Icon(Icons.search, color: Colors.black26, size: 20),
                                    const SizedBox(width: 10),
                                    
                                    Expanded(
                                      child: TextField(
                                        controller: _searchController,
                                        onChanged: (value) {
                                          setState(() {
                                            _searchQuery = value;
                                          });
                                        },
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF2E2E2E),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Cari semua ide dan inspirasi disini",
                                          hintStyle: const TextStyle(color: Colors.black26, fontSize: 14),
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0), 
                                          suffixIcon: isSearching 
                                              ? GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _searchController.clear();
                                                      _searchQuery = "";
                                                    });
                                                  },
                                                  child: const Icon(Icons.cancel, size: 18, color: Colors.black26),
                                                )
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.tune, 
                                color: Color(0xFF27AE60),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // KATEGORI TAB / HASIL PENCARIAN
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: isSearching
                        ? const Text(
                            "Hasil Pencarian",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E2E2E),
                            ),
                          )
                        : SizedBox(
                            height: 38,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final cat = categories[index];
                                final isSelected = selectedCategory == cat;
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ChoiceChip(
                                    label: Text(cat),
                                    selected: isSelected,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedCategory = cat;
                                      });
                                    },
                                    selectedColor: const Color(0xFF27AE60).withOpacity(0.1),
                                    labelStyle: TextStyle(
                                      color: isSelected ? const Color(0xFF27AE60) : Colors.black38,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                    backgroundColor: Colors.grey[100],
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: isSelected ? const Color(0xFF27AE60) : Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    showCheckmark: false,
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // ==========================================
            // 2. BAGIAN GRID LIST CARD (SLIVER)
            // ==========================================
            filteredIdeas.isEmpty
                ? const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text("Ide tidak ditemukan.", style: TextStyle(color: Colors.black38)),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.82,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final idea = filteredIdeas[index];
                          
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OverviewScreen(idea: idea),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.015),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                                      child: Image.network(
                                        idea.imageUrl,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => Container(
                                          color: Colors.green[50],
                                          child: const Icon(Icons.eco, color: Color(0xFF27AE60)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          idea.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF2E2E2E),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          idea.category,
                                          style: const TextStyle(color: Colors.black38, fontSize: 11),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${idea.difficulty} • ${idea.duration}",
                                          style: const TextStyle(
                                            color: Color(0xFF27AE60),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: filteredIdeas.length,
                      ),
                    ),
                  ),
            
            // Kasih padding bawah ekstra biar scroll penutupnya ngga terlalu mepet screen bawah
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }
}