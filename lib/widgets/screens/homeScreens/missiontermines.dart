import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class MissionTermine extends StatefulWidget {
  const MissionTermine({Key? key}) : super(key: key);

  @override
  State<MissionTermine> createState() => _MissionTermineState();
}

class _MissionTermineState extends State<MissionTermine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Mission Terminees"),
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}
