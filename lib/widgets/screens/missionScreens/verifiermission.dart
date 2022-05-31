import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class VerifierMission extends StatefulWidget {
  const VerifierMission({ Key? key }) : super(key: key);

  @override
  State<VerifierMission> createState() => _VerifierMissionState();
}

class _VerifierMissionState extends State<VerifierMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Verifier Mission "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}