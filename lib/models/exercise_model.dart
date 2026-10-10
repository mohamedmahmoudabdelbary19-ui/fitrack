class Exercise {
  final String name;
  final String muscle;
  final String instructions;
  final int sets;
  final int reps;
  final int restSeconds;

  Exercise({
    required this.name,
    required this.muscle,
    required this.instructions,
    this.sets = 3,
    this.reps = 12,
    this.restSeconds = 60,
  });
}