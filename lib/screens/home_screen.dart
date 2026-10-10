import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'ai_food_screen.dart';
import 'body_fat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Good Morning", style: TextStyle(color: AppColors.textGrey, fontSize: 14)),
                      Text("Abdelrahman", style: TextStyle(color: AppColors.textWhite, fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      _iconBox(Icons.local_fire_department, AppColors.orange),
                      const SizedBox(width: 10),
                      _iconBox(Icons.shopping_cart, AppColors.neonGreen),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.neonGreen.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("FIT-MART", style: TextStyle(color: AppColors.neonGreen, fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                        SizedBox(height: 5),
                        Text("Supplements for your goal", style: TextStyle(color: AppColors.textGrey, fontSize: 12)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neonGreen,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text("SHOP NOW", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(color: Color(0xFF2A2A2A), shape: BoxShape.circle),
                      child: const Icon(Icons.show_chart, color: AppColors.neonGreen, size: 30),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("PROGRESS TRACKING", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 3),
                        Text("Track your journey & achieve more", style: TextStyle(color: AppColors.textGrey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text("TODAY'S ACTIVITY", style: TextStyle(color: AppColors.textGrey, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _activityCircle("CALORIES", "0", "/ 1810 kcal", AppColors.orange, Icons.local_fire_department),
                  _activityCircle("WATER", "0", "/ 3.5 L", AppColors.waterBlue, Icons.water_drop),
                  _activityCircle("STEPS", "0", "/ 0 step", AppColors.stepsPurple, Icons.directions_walk),
                ],
              ),
              const SizedBox(height: 25),
              const Text("SMART FEATURES", style: TextStyle(color: AppColors.textGrey, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _smartFeature(
                      context, "AI SCANNER", "Smart Calories", Icons.camera_alt, AppColors.neonGreen,
                      () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AiFoodScreen())),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _smartFeature(
                      context, "AI DETECTOR", "Body Analysis", Icons.accessibility_new, AppColors.orange,
                      () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BodyFatScreen())),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(12)),
      child: Icon(icon, color: color),
    );
  }

  Widget _activityCircle(String title, String value, String subtitle, Color color, IconData icon) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: 0.0,
                strokeWidth: 6,
                backgroundColor: AppColors.cardBg,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Column(
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(subtitle, style: const TextStyle(color: AppColors.textGrey, fontSize: 10)),
      ],
    );
  }

  Widget _smartFeature(BuildContext context, String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 3),
            Text(subtitle, style: const TextStyle(color: AppColors.textGrey, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}