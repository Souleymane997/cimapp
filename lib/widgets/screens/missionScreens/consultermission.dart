import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class ConsulterMission extends StatefulWidget {
  const ConsulterMission({ Key? key }) : super(key: key);

  @override
  State<ConsulterMission> createState() => _ConsulterMissionState();
}

class _ConsulterMissionState extends State<ConsulterMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Consulter Mission "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}