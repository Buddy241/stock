import 'package:flutter/material.dart';
import 'package:stock_cala/colors/color_s.dart';

import '../favourite/favo_screen.dart';
import '../settings/setting_page.dart';
import 'model_home.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 190,
            floating: true,
            pinned: true,
            backgroundColor: appbar,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
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
                              child: Text("HI", style: TextStyle(color: black)),

                              backgroundColor: Colors.grey.withOpacity(0.2),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Hello Buddy !",
                              style: FontStyles.italicStyle2(15),),
                            ListTile(
                              leading: Icon(Icons.settings),
                              title: Text('Settings',
                                style: FontStyles.regularStyle(15),),
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
                                'About', style: FontStyles.regularStyle(15),),
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
                              title: Text('Feed back',
                                style: FontStyles.regularStyle(15),),
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
            actions: [
              IconButton(
                icon: Icon(Icons.bookmark_border, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoScreen()));
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.search, color: Colors.white),
              //   onPressed: () {
              //     setState(() {
              //       showtextform = !showtextform;
              //     });
              //     if (showtextform)
              //       TextFormField(
              //         decoration: InputDecoration(
              //             hintText: "Search",
              //             border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.only()
              //             )
              //         ),
              //       );
              //   },
              // ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "The overall average price of stocks , continuously updated as new shares are added.",
                  style: FontStyles.italicStyle(16),
                  maxLines: 2,
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
                  Text(
                    " Calculata your Stock Average & Profit Calculators",
                    style: FontStyles.regularStyle(19),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 65),
                              GestureDetector(
                                  child: buildSIPOption(
                                      "averge calcu", Icons.lan)
                              ),
                              GestureDetector(
                                  child: buildSIPOption(
                                      "profit calcu", Icons.attach_money)),
                              GestureDetector(
                                  child: buildSIPOption(
                                      "loss Recover", Icons.close_sharp)),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 65),
                              GestureDetector(
                                  child: buildSIPOption(
                                      "Ave price per", Icons.equalizer)
                              ),
                              GestureDetector(
                                  child: buildSIPOption(
                                      "Present Infla", Icons.line_axis)),
                              GestureDetector(
                                  child: buildSIPOption("Feature Infla",
                                      Icons.data_thresholding_outlined)),
                              SizedBox(height: 10),
                            ],
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

    );
  }

}
