import 'package:flutter/material.dart';
import 'package:stock_cala/colors/color_s.dart';

class LossCalcu extends StatefulWidget {
  const LossCalcu({super.key});

  @override
  State<LossCalcu> createState() => _LossCalcuState();
}

class _LossCalcuState extends State<LossCalcu> {
  bool isCalculated = false;

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController currentPriceController = TextEditingController();
  final TextEditingController currentLossController = TextEditingController();
  final TextEditingController recoverAmountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
              Row(
                children: [
                  Text(
                    'Total Calculations',
                    style: FontStyles.boldStyle(19),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170.0),
                    child: GestureDetector(
                      onTap: () {
                        _showSaveDialog(context);
                      },
                      child: Text(
                        'Save',
                        style: FontStyles.boldStyle(19),
                      ),
                    ),
                  ),
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
                    'New Shares Qty :',
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
                    'Total Shares :',
                    style: FontStyles.regularStyle(15),
                  ),
                  Text('₹ ${netSellPrice.toStringAsFixed(2)}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost :',
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
                    'Averaged PP Share :',
                    style: FontStyles.regularStyle(15),
                  ),
                  Text('₹ ${netSellPrice.toStringAsFixed(2)}'),
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
    final double currentPrice =
        double.tryParse(currentPriceController.text) ?? 0;
    final double currentLoss = double.tryParse(currentLossController.text) ?? 0;
    final double recoverAmount =
        double.tryParse(recoverAmountController.text) ?? 0;

    setState(() {
      netBuyPrice = (quantity * purchasePrice) + currentLoss;
      netSellPrice =
          ((quantity * purchasePrice) + recoverAmount + currentLoss) / quantity;
      netProfitOrLoss = (netSellPrice * quantity) - netBuyPrice;
      isCalculated = true;
    });

    _showBottomSheet(context);
  }

  void _resetFields() {
    setState(() {
      isCalculated = false;
      quantityController.clear();
      purchasePriceController.clear();
      currentPriceController.clear();
      currentLossController.clear();
      recoverAmountController.clear();
      netBuyPrice = 0;
      netSellPrice = 0;
      netProfitOrLoss = 0;
    });
  }

  _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Name to Save'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Enter your name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                String enteredName = nameController.text;
                print('Name saved: $enteredName');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
            'Loss Recovery',
            style: FontStyles.italicStyle(20),
          ),
        ),
        body: Column(
          children: [
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
                controller: currentPriceController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Current Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Current Price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: currentLossController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Current Loss',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Current Loss
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: recoverAmountController,
                style: FontStyles.regularStyle(15),
                decoration: const InputDecoration(
                  labelText: 'Recover Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            /// Recover Amount
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
                    isCalculated ? 'RESET' : 'CALCULATE RECOVERY',
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
