import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart, color: AppColors.neonGreen), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Icon(Icons.medication, color: AppColors.neonGreen, size: 100)),
            ),
            const SizedBox(height: 20),
            Text(product.category, style: const TextStyle(color: AppColors.neonGreen, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(product.name, style: const TextStyle(color: AppColors.textWhite, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 5),
                Text("${product.rating}", style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Text(product.description, style: const TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.5)),
            const SizedBox(height: 20),
            Row(
              children: [
                Text("${product.oldPrice.toStringAsFixed(2)} LE", style: const TextStyle(color: AppColors.textGrey, fontSize: 14, decoration: TextDecoration.lineThrough)),
                const SizedBox(width: 10),
                Text("${product.price.toStringAsFixed(2)} LE", style: const TextStyle(color: AppColors.neonGreen, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neonGreen,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("Add to Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}