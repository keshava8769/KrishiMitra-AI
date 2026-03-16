import 'package:flutter/material.dart';
import '../../utils/fertilizer_calculator.dart';

class FertilizerScreen extends StatefulWidget {
  const FertilizerScreen({super.key});

  @override
  State<FertilizerScreen> createState() => _FertilizerScreenState();
}

class _FertilizerScreenState extends State<FertilizerScreen> {
  String selectedCrop = "Paddy";
  final TextEditingController acreController = TextEditingController();

  String result = "";

  final List<String> crops = [
    "Paddy",
    "Tomato",
    "Cotton",
    "Maize"
  ];

  void calculate() {
    double acres = double.tryParse(acreController.text) ?? 0;

    if (acres <= 0) {
      setState(() {
        result = "Please enter valid field size.";
      });
      return;
    }

    final fertilizerData =
        FertilizerCalculator.calculate(selectedCrop, acres);

    setState(() {
      result =
          "Recommended Fertilizers:\n\nUrea: ${fertilizerData['urea']} kg\nDAP: ${fertilizerData['dap']} kg\nPotash: ${fertilizerData['potash']} kg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fertilizer Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: selectedCrop,
              items: crops
                  .map((crop) => DropdownMenuItem(
                        value: crop,
                        child: Text(crop),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCrop = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Select Crop",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: acreController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Field Size (Acres)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}