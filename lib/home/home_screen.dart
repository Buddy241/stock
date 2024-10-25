import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:stock_cala/colors/color_s.dart';

import '../Average Price Per/Screen_price_per.dart';
import '../Feature Inflactions/Screen_Feature_inf.dart';
import '../Present Inflation/Screen_present_ibflation.dart';
import '../Stock_ave_calc/Screen_stock.dart';
import '../favourite/favo_screen.dart';
import '../loss_recover/loss_screen.dart';
import '../profit/profit_calcu.dart';
import '../settings/setting_page.dart';
import 'model_home.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 190,
              floating: true,
              pinned: true,
              backgroundColor: appbar,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInRightBig(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  child: Text("HI",
                                      style: TextStyle(color: black)),
                                  backgroundColor:
                                      Colors.white38.withOpacity(0.2),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Hello Buddy !",
                                  style: FontStyles.italicStyle2(15),
                                ),
                                ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text(
                                    'Settings',
                                    style: FontStyles.regularStyle(15),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SettingPage()),
                                    );
                                  },
                                ),
                                Divider(
                                  color: black,
                                  thickness: 0.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                ListTile(
                                  leading: Icon(Icons.info),
                                  title: Text(
                                    'About',
                                    style: FontStyles.regularStyle(15),
                                  ),
                                  onTap: () {},
                                ),
                                Divider(
                                  color: black,
                                  thickness: 0.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                ListTile(
                                  leading: Icon(Icons.feedback_outlined),
                                  title: Text(
                                    'Feed back',
                                    style: FontStyles.regularStyle(15),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      child: Text("ST", style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.bookmark_border, color: Colors.white),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavoScreen()));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeInUpBig(
                    child: Text(
                      "The overall average price of stocks, continuously updated as new shares are added.",
                      style: FontStyles.italicStyle(16),
                      maxLines: 2,
                    ),
                  ),
                ),
                background: Stack(
                  children: [
                    ClipPath(
                      child: Container(
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    ZoomIn(
                      child: Text(
                        " Calculata your Stock Average & Profit Calculators",
                        style: FontStyles.regularStyle(19),
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      color: text,
                      elevation: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FadeInLeft(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 65),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShareCalculator()));
                                      },
                                      child: buildSIPOption(
                                          "averge calcu", Icons.lan)),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfitCalcu()));
                                      },
                                      child: buildSIPOption(
                                          "profit calcu", Icons.attach_money)),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LossCalcu()));
                                      },
                                      child: buildSIPOption(
                                          "loss Recover", Icons.close_sharp)),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          FadeInRight(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 65),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Avgpricepre()));
                                      },
                                      child: buildSIPOption(
                                          "Ave price per", Icons.equalizer)),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PressentInfl()));
                                      },
                                      child: buildSIPOption(
                                          "Present Infla", Icons.line_axis)),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Feature_inf(
                                                      isDarkMode: false,
                                                    )));
                                      },
                                      child: buildSIPOption("Feature Infla",
                                          Icons.data_thresholding_outlined)),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
