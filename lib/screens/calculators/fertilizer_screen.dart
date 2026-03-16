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

  /// Major Crops in India
  final List<String> crops = [
    "Paddy",
    "Wheat",
    "Maize",
    "Cotton",
    "Sugarcane",
    "Groundnut",
    "Soybean",
    "Mustard",
    "Tomato",
    "Potato",
    "Onion",
    "Chickpea",
    "Turmeric",
    "Sunflower",
    "Barley",
    "Jowar",
    "Bajra"
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
      backgroundColor: const Color(0xFFF5E6D3),

      appBar: AppBar(
        title: const Text("Fertilizer Calculator"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            /// SELECT CROP
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonFormField(
                initialValue: selectedCrop,
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
                  border: InputBorder.none,
                  labelText: "Select Crop",
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// FIELD SIZE INPUT
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: acreController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  border: InputBorder.none,
                  labelText: "Field Size (Acres)",
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// CALCULATE BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: calculate,
                child: const Text(
                  "Calculate Fertilizer",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// RESULT BOX
            if (result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                ),
              )
          ],
        ),
      ),
    );
  }
}