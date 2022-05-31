import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class BudgetMission extends StatefulWidget {
  const BudgetMission({ Key? key }) : super(key: key);

  @override
  State<BudgetMission> createState() => _BudgetMissionState();
}

class _BudgetMissionState extends State<BudgetMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Budget Mission "),
        
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}