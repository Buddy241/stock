import 'package:flutter/material.dart';

import '../colors/color_s.dart';
import '../home/model_home.dart';
class FavoScreen extends StatefulWidget {
  const FavoScreen({super.key});

  @override
  State<FavoScreen> createState() => _FavoScreenState();
}

class _FavoScreenState extends State<FavoScreen> {
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
       title: Text("Saved Calculataions",style:FontStyles.boldStyle1(16),),
     ),
    );
  }
}

