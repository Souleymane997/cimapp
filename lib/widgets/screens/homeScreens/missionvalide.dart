import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class MissionValide extends StatefulWidget {
  const MissionValide({Key? key}) : super(key: key);

  @override
  State<MissionValide> createState() => _MissionValideState();
}

class _MissionValideState extends State<MissionValide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Mission Validee"),
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}
