import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/dialoguetoast.dart';
import '../../../models/infos.dart';
import '../../../modelsrequest/getresponse.dart';
import '../../../parser.dart';

class CloturerMission extends StatefulWidget {
  final GetMissionUser element;
  const CloturerMission({Key? key, required this.element}) : super(key: key);

  @override
  State<CloturerMission> createState() => _CloturerMissionState();
}

class _CloturerMissionState extends State<CloturerMission> {
  int numMission = 0;

  int codeAgent = 0;
  late SharedPreferences saveDataUser;
  late GetLoginReponse reponseLogin;

  loadData() async {
    saveDataUser = await SharedPreferences.getInstance();

    String? repString = saveDataUser.getString('user');

    if (repString!.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(repString);
      reponseLogin = GetLoginReponse.fromJson(map);
      codeAgent = reponseLogin.codeAgent!;
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    numMission = widget.element.numMission!;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Mission à Cloturer ",
          tex: TailleText(context).titre,
        ),
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
          onTap: () {
            /* Do something */
            confirmeDialogue(
                context, "Confirmer vous le rejet ?", 7, rejetMission);
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.check),
          label: 'Cloturer',
          backgroundColor: Colors.greenAccent,
          onTap: () {
            /* Do someting */

            confirmeDialogue(
                context, "Confirmer vous la Cloture ?", 7, clotureMission);
          },
        ),
      ]),
    );
  }

  clotureMission() async {
    String observation = "mission Cloture";
    int codeEtat = 7;
    bool result = await Parser().putData(numMission, codeEtat, observation);

    if (result) {
      DInfo.toastSuccess(" Cloture effectuée avec success ");
      debugPrint("etape validé avec success");
      notifFunction(numMission, codeAgent, "mission cloture");
    } else {
      debugPrint("erreur de Connection ou saisie");
      DInfo.toastError(" Echec de la Cloture ");
    }
  }

  rejetMission() async {
    String observation = "mission rejeté";
    int codeEtat = 8;
    bool result = await Parser().putData(numMission, codeEtat, observation);

    if (result) {
      DInfo.toastSuccess(" Refus de la Cloture ");
      debugPrint("mission rejetée");
      notifFunction(numMission, codeAgent, "mission rejeter");
    } else {
      debugPrint("erreur de Connection ou saisie");
      DInfo.toastError(" Echec de la Cloture ");
    }
  }
}
