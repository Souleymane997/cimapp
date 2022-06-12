import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../modelsrequest/getresponse.dart';

class ConsulterMission extends StatefulWidget {
  final getReponse element;
  const ConsulterMission({Key? key, required this.element}) : super(key: key);

  @override
  State<ConsulterMission> createState() => _ConsulterMissionState();
}

class _ConsulterMissionState extends State<ConsulterMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Consulter Mission ", tex: 1.2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          detailWidget(context, widget.element),
        ]),
      ),
    );
  }
}
