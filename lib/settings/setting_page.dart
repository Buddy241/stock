import 'package:flutter/material.dart';

import '../colors/color_s.dart';
import '../home/model_home.dart';
import '../home/screen_home.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


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

        title: Row(
          children: [
            Text("Settings",style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("About",style:
                FontStyles.boldStyle(20),
                ),
              ),
          ),///text

          Divider(
            color: black,
            thickness: 0.5,
            indent: 10,
            endIndent: 10,
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title:  Text("FeedBack",style: TextStyle(color: black,fontSize: 17),),
            ),
          ),///feedback
          Divider(
            color: black,
            thickness: 0.5,
            indent: 10,
            endIndent: 10,
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.share_outlined),
              title:  Text("Share App",style: TextStyle(color: black,fontSize: 17),),
            ),
          ),///share icon

        ],
      ),
    );
  }
}
