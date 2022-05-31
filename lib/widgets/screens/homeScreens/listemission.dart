import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class ListeMission extends StatefulWidget {
  const ListeMission({ Key? key }) : super(key: key);

  @override
  State<ListeMission> createState() => _ListeMissionState();
}

class _ListeMissionState extends State<ListeMission> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: CustomText(" Liste des Missions"),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}