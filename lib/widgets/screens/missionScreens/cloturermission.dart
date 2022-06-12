import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../modelsrequest/getresponse.dart';

class CloturerMission extends StatefulWidget {
  final getReponse element;
  const CloturerMission({Key? key, required this.element}) : super(key: key);

  @override
  State<CloturerMission> createState() => _CloturerMissionState();
}

class _CloturerMissionState extends State<CloturerMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Mission à Cloturer ", tex: 1.2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          detailWidget(context, widget.element),
        ]),
      ),
      floatingActionButton:
          SpeedDial(icon: Icons.edit, backgroundColor: bleuClaire(), children: [
        SpeedDialChild(
          child: const Icon(Icons.close),
          label: 'Rejeter',
          backgroundColor: Colors.red,
          onTap: () {/* Do something */},
        ),
        SpeedDialChild(
          child: const Icon(Icons.check),
          label: 'Cloturer',
          backgroundColor: Colors.greenAccent,
          onTap: () {/* Do someting */},
        ),
      ]),
    );
  }
}
