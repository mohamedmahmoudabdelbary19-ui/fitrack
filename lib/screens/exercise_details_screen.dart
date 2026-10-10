import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/exercise_model.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseDetailsScreen({super.key, required this.exercise});

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
        title: Text(exercise.name, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(20)),
              child: const Center(child: Icon(Icons.play_circle_fill, color: AppColors.neonGreen, size: 80)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item("Sets", "${exercise.sets}"),
                _item("Reps", "${exercise.reps}"),
                _item("Rest", "${exercise.restSeconds}s"),
              ],
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Instructions", style: TextStyle(color: AppColors.textWhite, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Text(exercise.instructions, style: const TextStyle(color: AppColors.textGrey, fontSize: 14, height: 1.5)),
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
                child: const Text("Add to Workout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: AppColors.textGrey, fontSize: 14)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(color: AppColors.textWhite, fontSize: 22, fontWeight: FontWeight.bold)),
      ],
    );
  }
}