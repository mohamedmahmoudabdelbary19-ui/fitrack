import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/exercise_model.dart';
import 'exercise_details_screen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int _selectedTab = 0;

  final List<Exercise> exercises = [
    Exercise(name: "Ab Coaster Machine", muscle: "ABS", instructions: "Kneel on the machine and engage core."),
    Exercise(name: "Ab Wheel Rollout", muscle: "ABS", instructions: "Roll the wheel forward while keeping back straight."),
    Exercise(name: "Air Bike Crunch", muscle: "ABS", instructions: "Alternate elbow to opposite knee."),
    Exercise(name: "Alternating Dumbbell Bicep", muscle: "BICEPS", instructions: "Curl dumbbell while alternating arms."),
    Exercise(name: "Bench Press", muscle: "CHEST", instructions: "Press the bar up while keeping feet flat."),
    Exercise(name: "Deadlift", muscle: "BACK", instructions: "Lift the bar while keeping back straight."),
  ];

  final List<Map<String, String>> programs = [
    {"name": "Push", "status": "Active", "color": "0xFF9C27B0"},
    {"name": "Pull", "status": "Inactive", "color": "0xFF2196F3"},
    {"name": "Legs", "status": "Inactive", "color": "0xFFFF5722"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.neonGreen.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  _tabButton("Programs", 0),
                  _tabButton("Exercises", 1),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: _selectedTab == 0 ? _buildProgramsTab() : _buildExercisesTab()),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index) {
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
            child: Text(
              label,
              style: TextStyle(
                color: _selectedTab == index ? Colors.black : AppColors.textGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgramsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _cardBtn("My Library", "Programs & routines", Icons.book, AppColors.neonGreen)),
              const SizedBox(width: 15),
              Expanded(child: _cardBtn("Progress", "Logs & reports", Icons.bar_chart, AppColors.cardBg)),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1C2E1C),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: AppColors.neonGreen, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                    const SizedBox(width: 15),
                    const Text("BUILD YOUR WORKOUT", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Create a custom program", style: TextStyle(color: AppColors.textGrey, fontSize: 13)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    _smallTag("+ Exercises"),
                    const SizedBox(width: 10),
                    _smallTag("Sets"),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neonGreen,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Start", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFF2E1C1C), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.orange, borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.local_fire_department, color: Colors.white),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text("READY-MADE PROGRAMS", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 14)),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Browse", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("YOUR PROGRAMS", style: TextStyle(color: AppColors.textGrey, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          ),
          const SizedBox(height: 15),
          ...programs.map((p) => _programItem(p)).toList(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildExercisesTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(15)),
            child: const TextField(
              style: TextStyle(color: AppColors.textWhite),
              decoration: InputDecoration(
                hintText: "Search Exercises...",
                hintStyle: TextStyle(color: AppColors.textGrey),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: AppColors.textGrey),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.85,
            ),
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final e = exercises[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ExerciseDetailsScreen(exercise: e)),
                ),
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
                          child: const Icon(Icons.fitness_center, color: AppColors.neonGreen, size: 50),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 13)),
                            const SizedBox(height: 5),
                            Text(e.muscle, style: const TextStyle(color: AppColors.textGrey, fontSize: 11)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _cardBtn(String title, String subtitle, IconData icon, Color bg) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: bg == AppColors.neonGreen ? Colors.black : AppColors.textWhite, size: 30),
          const SizedBox(height: 10),
          Text(title, style: TextStyle(color: bg == AppColors.neonGreen ? Colors.black : AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 3),
          Text(subtitle, style: TextStyle(color: bg == AppColors.neonGreen ? Colors.black54 : AppColors.textGrey, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _smallTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: const Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: const TextStyle(color: AppColors.textGrey, fontSize: 10)),
    );
  }

  Widget _programItem(Map<String, String> program) {
    Color color = Color(int.parse(program['color']!));
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
            child: Text(program['name']!.substring(0, 2).toUpperCase(), style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(program['name']!, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 3),
                Text(program['status']!, style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.bolt, color: AppColors.neonGreen),
          const SizedBox(width: 10),
          const Icon(Icons.delete_outline, color: AppColors.textGrey),
        ],
      ),
    );
  }
}