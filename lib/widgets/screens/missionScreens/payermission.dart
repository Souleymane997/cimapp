import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class PayerMission extends StatefulWidget {
  const PayerMission({Key? key}) : super(key: key);

  @override
  State<PayerMission> createState() => _PayerMissionState();
}

class _PayerMissionState extends State<PayerMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Payer Mission "),
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}
