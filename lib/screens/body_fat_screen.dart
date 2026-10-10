import 'package:flutter/material.dart';
import '../theme/colors.dart';

class BodyFatScreen extends StatelessWidget {
  const BodyFatScreen({super.key});

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
        title: const Text("Body Fat Analysis", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _box("Front view", Icons.person),
                  _box("Back view", Icons.person_outline),
                  _box("Side view", Icons.accessibility),
                  _box("Flex view", Icons.sports_gymnastics),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Add your body photos", style: TextStyle(color: AppColors.textWhite, fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            const Text(
              "For better accuracy, take clear front, back, and side photos. A flex photo is optional.",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textGrey, fontSize: 13),
            ),
            const SizedBox(height: 30),
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
                child: const Text("Start Detecting", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(String label, IconData icon) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: AppColors.neonGreen, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.neonGreen.withOpacity(0.3)),
            ),
            child: Center(child: Icon(icon, color: AppColors.textGrey, size: 50)),
          ),
        ),
      ],
    );
  }
}