
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors/color_s.dart';

Widget buildSIPOption(String title, IconData icon) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Icon(icon, color: Colors.blue),
        radius: 25,
      ),
      SizedBox(height: 5),
      Text(title,style: FontStyles.regularStyle(16),),
    ],
  );
}



bool showtextform = false;