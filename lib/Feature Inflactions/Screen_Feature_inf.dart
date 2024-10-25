import 'package:flutter/material.dart';

import '../colors/color_s.dart';

class Feature_inf extends StatefulWidget {
  final bool isDarkMode;
  const Feature_inf({super.key, required this.isDarkMode});

  @override
  State<Feature_inf> createState() => _Feature_infState();
}

class _Feature_infState extends State<Feature_inf> {
  final TextEditingController presentValueController = TextEditingController();
  final TextEditingController inflationRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  bool isCalculated = false;

  void _calculateFutureValue() {
    final double presentValue =
        double.tryParse(presentValueController.text) ?? 0;
    final double inflationRate =
        double.tryParse(inflationRateController.text) ?? 0;
    final double yearsHeld = double.tryParse(yearsController.text) ?? 0;

    double futureValue = presentValue;
    for (int i = 0; i < yearsHeld; i++) {
      futureValue *= (1 + inflationRate / 100);
    }

    _showResultDialog(futureValue);
  }

  void _showResultDialog(double futureValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Future Value'),
          content:
              Text('The future value is: ₹ ${futureValue.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _resetFields() {
    setState(() {
      isCalculated = false;
      presentValueController.clear();
      inflationRateController.clear();
      yearsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.isDarkMode;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Colors.blue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Future Value Calculator',
            style: FontStyles.italicStyle(20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: presentValueController,
                style: FontStyles.regularStyle(15),
                decoration: InputDecoration(
                  labelText: 'Present Value',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: inflationRateController,
                style: FontStyles.regularStyle(15),
                decoration: InputDecoration(
                  labelText: 'Inflation Rate (%)',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: yearsController,
                style: FontStyles.regularStyle(15),
                decoration: InputDecoration(
                  labelText: 'Years Held',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: isCalculated ? _resetFields : _calculateFutureValue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.black : Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Center(
                  child: Text(
                    isCalculated ? 'RESET' : 'CALCULATE',
                    style: FontStyles.regularStyle1(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
