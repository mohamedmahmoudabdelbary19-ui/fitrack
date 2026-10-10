import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/product_model.dart';
import 'product_details_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  final List<Product> products = const [
    Product(name: "Dozova Man Max Multivitamin", category: "VITAMINS", price: 234.00, oldPrice: 260.00, rating: 4.5, description: "Premium daily multivitamin for men."),
    Product(name: "Dozova Melatonin 5mg", category: "SLEEP SUPPORT", price: 134.10, oldPrice: 149.00, rating: 4.0, description: "Helps improve sleep quality."),
    Product(name: "Dozova NAD+", category: "ANTI-AGING", price: 350.00, oldPrice: 400.00, rating: 5.0, description: "Anti-aging and energy booster."),
    Product(name: "Natrol Biotin 10000mcg", category: "HAIR & SKIN", price: 280.00, oldPrice: 320.00, rating: 4.2, description: "Supports healthy hair and skin."),
  ];

  final List<Map<String, dynamic>> categories = const [
    {"name": "Special Discount", "icon": Icons.local_offer},
    {"name": "Fat Loss", "icon": Icons.local_fire_department},
    {"name": "Vitamins", "icon": Icons.medical_services},
    {"name": "Whey Protein", "icon": Icons.fitness_center},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("FitRack Shop", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart, color: AppColors.neonGreen), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF2E1C1C), Color(0xFF1C2E1C)]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  const Positioned(left: 20, top: 30, child: Text("BIG\nSALE", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, height: 0.9))),
                  Positioned(
                    left: 20, bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(10)),
                      child: const Text("10% OFF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 2.5),
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final c = categories[i];
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(c['icon'], color: AppColors.neonGreen, size: 24),
                      const SizedBox(width: 10),
                      Expanded(child: Text(c['name'], style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 13))),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            const Text("All Products", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.75),
              itemCount: products.length,
              itemBuilder: (context, i) {
                final p = products[i];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: p))),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: const Center(child: Icon(Icons.medication, color: AppColors.neonGreen, size: 60)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(p.category, style: const TextStyle(color: AppColors.neonGreen, fontSize: 10, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 12)),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${p.price.toStringAsFixed(2)} LE", style: const TextStyle(color: AppColors.neonGreen, fontSize: 14, fontWeight: FontWeight.bold)),
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(color: AppColors.neonGreen, shape: BoxShape.circle),
                                    child: const Icon(Icons.add, color: Colors.black, size: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}