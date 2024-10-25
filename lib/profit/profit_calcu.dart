import 'package:flutter/material.dart';
import 'package:stock_cala/colors/color_s.dart';

class ProfitCalcu extends StatefulWidget {
  const ProfitCalcu({super.key});

  @override
  State<ProfitCalcu> createState() => _ProfitCalcuState();
}

class _ProfitCalcuState extends State<ProfitCalcu> {
  bool isCalculated = false;

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController sellPriceController = TextEditingController();
  final TextEditingController buyCommissionController = TextEditingController();
  final TextEditingController sellCommissionController =
      TextEditingController();

  double netBuyPrice = 0;
  double netSellPrice = 0;
  double netProfitOrLoss = 0;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Calculations',
                style: FontStyles.boldStyle(19),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black,
                thickness: 0.4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Net Buy Price :',
                    style: FontStyles.regularStyle(15),
                  ),
                  Text('₹ ${netBuyPrice.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Net Sell Price :',
                    style: FontStyles.regularStyle(15),
                  ),
                  Text('₹ ${netSellPrice.toStringAsFixed(2)}'),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black,
                thickness: 0.4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    netProfitOrLoss >= 0 ? 'Net Profit :' : 'Net Loss :',
                    style: FontStyles.boldStyle(19),
                  ),
                  Text(
                    '₹ ${netProfitOrLoss.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: netProfitOrLoss >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _calculateAndShowSheet() {
    final double quantity = double.tryParse(quantityController.text) ?? 0;
    final double purchasePrice =
        double.tryParse(purchasePriceController.text) ?? 0;
    final double sellPrice = double.tryParse(sellPriceController.text) ?? 0;
    final double buyCommission =
        double.tryParse(buyCommissionController.text) ?? 0;
    final double sellCommission =
        double.tryParse(sellCommissionController.text) ?? 0;

    setState(() {
      netBuyPrice = (quantity * purchasePrice) + buyCommission;
      netSellPrice = (quantity * sellPrice) - sellCommission;
      netProfitOrLoss = netSellPrice - netBuyPrice;
      isCalculated = true;
    });

    _showBottomSheet(context);
  }

  void _resetFields() {
    setState(() {
      isCalculated = false;
      quantityController.clear();
      purchasePriceController.clear();
      sellPriceController.clear();
      buyCommissionController.clear();
      sellCommissionController.clear();
      netBuyPrice = 0;
      netSellPrice = 0;
      netProfitOrLoss = 0;
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
            'Profit Calculator',
            style: FontStyles.italicStyle(20),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Do not save what is left after spending, but spend what is left after saving.",
                style: FontStyles.italicStyle2(19),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: quantityController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Share Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Share Quantity
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: purchasePriceController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Purchase Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Purchase Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sellPriceController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Sell Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Sell Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: buyCommissionController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Buy Commission',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Buy Commission
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: sellCommissionController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Sell Commission',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Sell Commission
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: isCalculated ? _resetFields : _calculateAndShowSheet,
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
                    isCalculated ? 'RESET' : 'CALCULATE AVERAGE',
                    style: FontStyles.regularStyle1(15),
                  ),
                ),
              ),
            ),

            /// Button
          ],
        ),
      ),
    );
  }
}
