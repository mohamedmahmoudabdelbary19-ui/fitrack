class Recipe {
  final String name;
  final String tag;
  final int calories;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.tag,
    required this.calories,
    required this.ingredients,
    required this.instructions,
  });
}