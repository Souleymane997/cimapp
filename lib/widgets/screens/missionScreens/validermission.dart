import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class ValiderMission extends StatefulWidget {
  const ValiderMission({ Key? key }) : super(key: key);

  @override
  State<ValiderMission> createState() => _ValiderMissionState();
}

class _ValiderMissionState extends State<ValiderMission> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: CustomText("Valider Mission "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}