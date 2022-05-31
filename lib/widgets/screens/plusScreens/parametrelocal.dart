import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class ParamLocal extends StatefulWidget {
  const ParamLocal({Key? key}) : super(key: key);

  @override
  State<ParamLocal> createState() => _ParamLocalState();
}

class _ParamLocalState extends State<ParamLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Parametres Local "),
      ),
      body: Container(
          width: 500,
          height: 250,
          color: Colors.red,
          child: CustomText("hello", color: bleuClaire())),
    );
  }
}
