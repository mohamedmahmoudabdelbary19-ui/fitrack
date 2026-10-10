import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AiFoodScreen extends StatefulWidget {
  const AiFoodScreen({super.key});

  @override
  State<AiFoodScreen> createState() => _AiFoodScreenState();
}

class _AiFoodScreenState extends State<AiFoodScreen> {
  bool isSimpleMode = true;

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
        title: const Text("AI Food Detector", style: TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  _tab("Simple", true),
                  _tab("Accurate", false),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _imageBox("Front view"),
                  _imageBox("Right view"),
                  _imageBox("Left view"),
                  _imageBox("Top view"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Add your meal image", style: TextStyle(color: AppColors.textWhite, fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            const Text(
              "For better accuracy, take a clear photo with good lighting and keep the food fully visible.",
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

  Widget _tab(String label, bool isSimple) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isSimpleMode = isSimple),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSimpleMode == isSimple ? AppColors.neonGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(label, style: TextStyle(color: isSimpleMode == isSimple ? Colors.black : AppColors.textGrey, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _imageBox(String label) {
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
            child: const Center(child: Icon(Icons.add_a_photo, color: AppColors.textGrey, size: 40)),
          ),
        ),
      ],
    );
  }
}