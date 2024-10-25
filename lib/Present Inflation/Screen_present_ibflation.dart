import 'package:flutter/material.dart';
import '../colors/color_s.dart';

class PressentInfl extends StatefulWidget {
  const PressentInfl({super.key});

  @override
  State<PressentInfl> createState() => _PressentInflState();
}

class _PressentInflState extends State<PressentInfl> {
  final TextEditingController presentValueController = TextEditingController();
  final TextEditingController inflationRateController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  bool isCalculated = false;

  void _calculatePresentValue() {
    final double futureValue =
        double.tryParse(presentValueController.text) ?? 0;
    final double inflationRate =
        double.tryParse(inflationRateController.text) ?? 0;
    final double yearsHeld = double.tryParse(yearsController.text) ?? 0;
    double presentValue = futureValue;
    for (int i = 0; i < yearsHeld; i++) {
      presentValue /= (1 + inflationRate / 100);
    }
    _showResultDialog(presentValue);
  }

  void _showResultDialog(double presentValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calculated Present Value'),
          content: Text('Present Value: ₹ ${presentValue.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetFields() {
    setState(() {
      presentValueController.clear();
      inflationRateController.clear();
      yearsController.clear();
      isCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbar,
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
            'Present Inflation',
            style: FontStyles.italicStyle(19),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: presentValueController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Future Value',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: inflationRateController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Inflation Rate (%)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: yearsController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Years Held',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _calculatePresentValue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Center(
                  child: Text(
                    'CALCULATE',
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
