import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class ParamCentral extends StatefulWidget {
  const ParamCentral({Key? key}) : super(key: key);

  @override
  State<ParamCentral> createState() => _ParamCentralState();
}

class _ParamCentralState extends State<ParamCentral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bleuFonce(),
      appBar: AppBar(
        title: CustomText("Parametre Central "),
      ),
      body: SafeArea(
        child: Center(
          child: CustomText(
            " Parametre ",
            tex: TailleText(context).titre * 1.1,
          ),
        ),
      ),
    );
  }
}
