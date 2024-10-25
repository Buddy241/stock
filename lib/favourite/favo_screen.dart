import 'package:flutter/material.dart';
import '../colors/color_s.dart';

class FavoScreen extends StatefulWidget {
  const FavoScreen({super.key});

  @override
  State<FavoScreen> createState() => _FavoScreenState();
}

class _FavoScreenState extends State<FavoScreen> {
  bool showtextform = false;

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
            title: showtextform
                ? TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                    autofocus: true,
                  )
                : Text(
                    "Saved Calculations",
                    style: FontStyles.boldStyle1(16),
                  ),
            actions: [
              IconButton(
                icon: Icon(
                  showtextform ? Icons.close : Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    showtextform = !showtextform;
                  });
                },
              ),
            ],
          ),
          body: Column(
            children: [],
          )),
    );
  }
}
