import 'package:flutter/material.dart';

import '../colors/color_s.dart';

class Avgpricepre extends StatefulWidget {
  const Avgpricepre({super.key});

  @override
  State<Avgpricepre> createState() => _AvgpricepreState();
}

class _AvgpricepreState extends State<Avgpricepre> {
  final TextEditingController OriginalShareQty = TextEditingController();
  final TextEditingController PurchasePrice = TextEditingController();
  final TextEditingController AveragedPricePerShare = TextEditingController();
  final TextEditingController NewPurchasePrice = TextEditingController();

  bool isCalculated = false;

  void _calculateAveragePrice() {
    final originalQty = double.tryParse(OriginalShareQty.text) ?? 0;
    final purchasePrice = double.tryParse(PurchasePrice.text) ?? 0;
    final averagedPrice = double.tryParse(AveragedPricePerShare.text) ?? 0;
    final newPurchasePrice = double.tryParse(NewPurchasePrice.text) ?? 0;

    double newAveragedPrice =
        ((originalQty * averagedPrice) + newPurchasePrice) / (originalQty + 1);

    _showResultDialog(newAveragedPrice);
  }

  void _showResultDialog(double newAveragedPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calculated Result'),
          content: Text(
              'The new average price per share is: ₹ ${newAveragedPrice.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    setState(() {
      isCalculated = true;
    });
  }

  void _resetFields() {
    setState(() {
      OriginalShareQty.clear();
      PurchasePrice.clear();
      AveragedPricePerShare.clear();
      NewPurchasePrice.clear();
      isCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Average Price Per Share',
          style: FontStyles.italicStyle(19),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: OriginalShareQty,
              style: FontStyles.regularStyle(15),
              decoration: const InputDecoration(
                labelText: 'Original Share Qty',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: PurchasePrice,
              style: FontStyles.regularStyle(15),
              decoration: const InputDecoration(
                labelText: 'Purchase Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: AveragedPricePerShare,
              style: FontStyles.regularStyle(15),
              decoration: const InputDecoration(
                labelText: 'Averaged Price Per Share',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: NewPurchasePrice,
              style: FontStyles.regularStyle(15),
              decoration: const InputDecoration(
                labelText: 'New Purchase Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: isCalculated ? _resetFields : _calculateAveragePrice,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              isCalculated ? 'RESET' : 'CALCULATE',
              style: FontStyles.regularStyle1(16),
            ),
          ),
        ],
      ),
    );
  }
}
