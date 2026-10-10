import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/recipe_model.dart';
import 'recipe_details_screen.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  int _selectedTab = 1;

  final List<Recipe> recipes = [
    Recipe(
      name: "Keto Spinach Egg White Skillet",
      tag: "High Protein",
      calories: 220,
      ingredients: ["4 egg whites", "1 cup spinach", "1 tbsp olive oil", "Salt & pepper"],
      instructions: "Heat oil in a skillet. Add spinach and cook until wilted. Pour egg whites and cook until set.",
    ),
    Recipe(
      name: "Greek Yogurt Oat Bowl",
      tag: "Dairy Free",
      calories: 350,
      ingredients: ["1 cup Greek yogurt", "1/2 cup oats", "Berries", "Honey"],
      instructions: "Mix yogurt with oats. Top with berries and honey.",
    ),
    Recipe(
      name: "Cottage Cheese Toast Plate",
      tag: "Gluten Free",
      calories: 280,
      ingredients: ["2 slices gluten-free bread", "1/2 cup cottage cheese", "Cherry tomatoes"],
      instructions: "Toast bread, spread cottage cheese, top with tomatoes.",
    ),
    Recipe(
      name: "Vegan Apple Oat Porridge",
      tag: "Vegan",
      calories: 300,
      ingredients: ["1 cup oats", "1 apple", "1 cup almond milk", "Cinnamon"],
      instructions: "Cook oats with almond milk. Add chopped apple and cinnamon.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Diary", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                _tab("Logs", 0),
                _tab("Recipes", 1),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(15)),
              child: const TextField(
                style: TextStyle(color: AppColors.textWhite),
                decoration: InputDecoration(
                  hintText: "Search Recipes...",
                  hintStyle: TextStyle(color: AppColors.textGrey),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: AppColors.textGrey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _chip("Dairy Free", true),
                _chip("Gluten Free", false),
                _chip("High Protein", false),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: _selectedTab == 1
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.8,
                    ),
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final r = recipes[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeDetailsScreen(recipe: r))),
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
                                  child: const Center(child: Icon(Icons.restaurant, color: AppColors.neonGreen, size: 50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(r.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 13)),
                                    const SizedBox(height: 5),
                                    Text("${r.calories} kcal", style: const TextStyle(color: AppColors.neonGreen, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: Text("Your daily logs will appear here", style: TextStyle(color: AppColors.textGrey))),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _tab(String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: _selectedTab == index ? AppColors.neonGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(label, style: TextStyle(color: _selectedTab == index ? Colors.black : AppColors.textGrey, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _chip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(label, style: TextStyle(color: isSelected ? Colors.black : AppColors.textWhite, fontWeight: FontWeight.bold)),
        backgroundColor: isSelected ? AppColors.neonGreen : AppColors.cardBg,
        side: BorderSide.none,
      ),
    );
  }
}