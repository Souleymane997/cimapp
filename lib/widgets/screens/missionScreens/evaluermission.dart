import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class EvaluerMission extends StatefulWidget {
  const EvaluerMission({ Key? key }) : super(key: key);

  @override
  State<EvaluerMission> createState() => _EvaluerMissionState();
}

class _EvaluerMissionState extends State<EvaluerMission> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: CustomText("Evaluer Mission "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}