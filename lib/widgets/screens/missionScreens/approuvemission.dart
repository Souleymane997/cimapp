import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class ApprouveMission extends StatefulWidget {
  const ApprouveMission({ Key? key }) : super(key: key);

  @override
  State<ApprouveMission> createState() => _ApprouveMissionState();
}

class _ApprouveMissionState extends State<ApprouveMission> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: CustomText("Approuver MIssion "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}