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
      backgroundColor: bleuFonce(),
      appBar: AppBar(
        title: CustomText("Parametres Local "),
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
