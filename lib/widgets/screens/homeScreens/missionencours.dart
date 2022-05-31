import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class MissionEnCours extends StatefulWidget {
  const MissionEnCours({Key? key}) : super(key: key);

  @override
  State<MissionEnCours> createState() => _MissionEnCoursState();
}

class _MissionEnCoursState extends State<MissionEnCours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(" Mission En cours "),
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}
