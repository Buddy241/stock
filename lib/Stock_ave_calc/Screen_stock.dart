import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors/color_s.dart';

class ShareCalculator extends StatefulWidget {
  @override
  _ShareCalculatorState createState() => _ShareCalculatorState();
}

class _ShareCalculatorState extends State<ShareCalculator> {
  List<Widget> shareCards = [];
  List<double> buyPrices = [];
  List<int> quantities = [];
  List<DateTime?> selectedDates = [];
  bool showAverageContainer = false;
  ScrollController _scrollController = ScrollController();
  TextEditingController durationController = TextEditingController();
  DateTime? _selectedDate;

  double totalAmount = 0;
  int totalQty = 0;
  double avgPrice = 0;

  @override
  void initState() {
    super.initState();

    shareCards.add(_buildShareCard('Share 1', dismissible: true));
    shareCards.add(_buildShareCard('Share 2', dismissible: true));
  }

  void _addNewShareCard() {
    if (shareCards.length >= 5) {
      _showToast('You cannot add more than 5 shares.');
      return;
    }

    setState(() {
      shareCards.add(
          _buildShareCard('Share ${shareCards.length + 1}', dismissible: true));
    });

    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _calculateAverage() {
    double totalCost = 0;
    int totalQuantity = 0;

    for (int i = 0; i < shareCards.length; i++) {
      if (buyPrices.length > i && quantities.length > i) {
        totalCost += buyPrices[i] * quantities[i];
        totalQuantity += quantities[i];
      }
    }

    if (totalQuantity < 2) {
      _showToast('Minimum 2 shares are required for average calculation.');
      return;
    }

    double averagePrice = totalQuantity > 0 ? totalCost / totalQuantity : 0;
    setState(() {
      showAverageContainer = true;
      totalAmount = totalCost;
      totalQty = totalQuantity;
      avgPrice = averagePrice;
    });
  }

  Widget _buildShareCard(String title, {required bool dismissible}) {
    final TextEditingController priceController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();

    Widget cardContent = Card(
      elevation: 10,
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: FontStyles.regularStyle(15),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  buyPrices.add(double.parse(value));
                } else {
                  buyPrices.add(0);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Stock Name',
                prefixText: '',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: priceController,
              style: FontStyles.regularStyle(15),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  buyPrices.add(double.parse(value));
                } else {
                  buyPrices.add(0);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Purchase Price',
                prefixText: '₹ ',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: quantityController,
              style: FontStyles.regularStyle(15),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  quantities.add(int.parse(value));
                } else {
                  quantities.add(0);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 430,
              child: TextField(
                controller: durationController,
                decoration: InputDecoration(
                  hintText: 'Select Date and Time',
                  hintStyle: FontStyles.regularStyle(15),
                  suffixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3)),
                ),
                readOnly: true,
                style: FontStyles.regularStyle(15),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                      durationController.text =
                          DateFormat('dd-MM-yyyy').format(_selectedDate!);
                      print(durationController.text);
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );

    return dismissible
        ? Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              if (shareCards.length > 2) {
                setState(() {
                  int index = shareCards.indexOf(cardContent);
                  if (buyPrices.length > index) buyPrices.removeAt(index);
                  if (quantities.length > index) quantities.removeAt(index);
                  shareCards.remove(cardContent);
                });

                _showToast('Share card deleted.');
              } else {
                _showToast('You must have at least 2 shares.');
              }
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: cardContent,
          )
        : cardContent;
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Share Average Calculator',
            style: FontStyles.italicStyle(19),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeIn(
                  duration: Duration(seconds: 2),
                  child: Text(
                    "When it comes to investing, average your buys, and let the market do the heavy lifting.",
                    style: FontStyles.italicStyle2(20),
                    maxLines: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: shareCards.length,
                      itemBuilder: (context, index) {
                        return shareCards[index];
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: _addNewShareCard,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        child: Text(
                          'Add New Shares',
                          style: FontStyles.regularStyle1(15),
                        ),
                      ),
                      if (shareCards.length >= 3)
                        IconButton(
                          onPressed: () {
                            if (shareCards.isNotEmpty) {
                              setState(() {
                                shareCards.removeLast();
                                if (buyPrices.isNotEmpty)
                                  buyPrices.removeLast();
                                if (quantities.isNotEmpty)
                                  quantities.removeLast();
                                _showToast('Last share card deleted.');
                              });
                            }
                          },
                          icon: Icon(Icons.delete),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                if (showAverageContainer)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share Price',
                          style: FontStyles.boldStyle(19),
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.black,
                          thickness: 0.4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total quantity',
                              style: FontStyles.regularStyle(15),
                            ),
                            Text('$totalQty'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Average price',
                              style: FontStyles.regularStyle(15),
                            ),
                            Text('₹ ${avgPrice.toStringAsFixed(2)}'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.black,
                          thickness: 0.4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: FontStyles.boldStyle(19),
                            ),
                            Text('₹ ${totalAmount.toStringAsFixed(2)}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateAverage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  child: Center(
                    child: Text(
                      'CALCULATE AVERAGE',
                      style: FontStyles.regularStyle1(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showAverageContainer = false;
                      buyPrices.clear();
                      quantities.clear();
                      totalAmount = 0;
                      totalQty = 0;
                      avgPrice = 0;
                      shareCards.clear();
                      shareCards
                          .add(_buildShareCard('Share 1', dismissible: true));
                      shareCards
                          .add(_buildShareCard('Share 2', dismissible: true));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  child: Center(
                    child: Text(
                      'Reset',
                      style: FontStyles.regularStyle(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
