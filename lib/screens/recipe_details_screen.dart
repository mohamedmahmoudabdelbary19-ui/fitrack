import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

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
        title: Text(recipe.name, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Icon(Icons.restaurant_menu, color: AppColors.neonGreen, size: 80)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(recipe.tag, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  backgroundColor: AppColors.neonGreen,
                ),
                Text("${recipe.calories} kcal", style: const TextStyle(color: AppColors.orange, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Ingredients", style: TextStyle(color: AppColors.textWhite, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...recipe.ingredients.map((i) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  const Icon(Icons.circle, color: AppColors.neonGreen, size: 8),
                  const SizedBox(width: 10),
                  Text(i, style: const TextStyle(color: AppColors.textGrey, fontSize: 14)),
                ],
              ),
            )),
            const SizedBox(height: 20),
            const Text("Instructions", style: TextStyle(color: AppColors.textWhite, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(recipe.instructions, style: const TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.5)),
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
                child: const Text("Add to Diary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}