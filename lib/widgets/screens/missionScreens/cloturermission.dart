import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class CloturerMission extends StatefulWidget {
  const CloturerMission({ Key? key }) : super(key: key);

  @override
  State<CloturerMission> createState() => _CloturerMissionState();
}

class _CloturerMissionState extends State<CloturerMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Cloturer Mission "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}