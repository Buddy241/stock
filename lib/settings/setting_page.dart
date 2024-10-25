import 'package:flutter/material.dart';
import '../colors/color_s.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkMode = false;
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
          title: Row(
            children: [
              Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                "Dark Mode ",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 17,
                ),
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),

            Divider(
              color: black,
              thickness: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            GestureDetector(
              child: ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: Text(
                  "FeedBack",
                  style: TextStyle(color: black, fontSize: 17),
                ),
              ),
            ),

            ///feedback
            Divider(
              color: black,
              thickness: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            GestureDetector(
              child: ListTile(
                leading: const Icon(Icons.share_outlined),
                title: Text(
                  "Share App",
                  style: TextStyle(color: black, fontSize: 17),
                ),
              ),
            ),

            ///share icon
          ],
        ),
      ),
    );
  }
}
