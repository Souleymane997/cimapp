import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/infos.dart';
import '../../../models/custom_text.dart';
import '../../../modelsrequest/getresponse.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ApprouveMission extends StatefulWidget {
  final getReponse element;
  const ApprouveMission({Key? key, required this.element}) : super(key: key);

  @override
  State<ApprouveMission> createState() => _ApprouveMissionState();
}

class _ApprouveMissionState extends State<ApprouveMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Mission à Approuver ", tex: 1.2),
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
          label: 'Approuver',
          backgroundColor: Colors.greenAccent,
          onTap: () {/* Do someting */},
        ),
      ]),
    );
  }
}
