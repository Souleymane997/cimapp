import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/dialoguetoast.dart';
import '../../../models/infos.dart';
import '../../../models/custom_text.dart';
import '../../../modelsrequest/getresponse.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../parser.dart';

class ApprouveMission extends StatefulWidget {
  final GetMissionUser element;
  const ApprouveMission({Key? key, required this.element}) : super(key: key);

  @override
  State<ApprouveMission> createState() => _ApprouveMissionState();
}

class _ApprouveMissionState extends State<ApprouveMission> {
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

    debugPrint(numMission.toString());
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Mission à Approuver ",
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
                context, "Confirmer vous le rejet ?", 2, rejetMission);
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.check),
          label: 'Approuver',
          backgroundColor: Colors.greenAccent,
          onTap: () {
            /* Do someting */
            confirmeDialogue(
                context, "Confirmer vous l'approbation ?", 2, approuveMission);
          },
        ),
      ]),
    );
  }

  approuveMission() async {
    String observation = "mission approuve";
    int codeEtat = 2;
    bool result = await Parser().putData(numMission, codeEtat, observation);

    if (result) {
      DInfo.toastSuccess(" Approbation effectuée avec success ");
      debugPrint("etape validé avec success");
      Timer(const Duration(seconds: 5), () {
        notifFunction(numMission, codeAgent, "mission approuve");
      });
    } else {
      debugPrint("erreur de Connection ou saisie");
      DInfo.toastError(" Echec de l'approbation ");
    }
  }

  rejetMission() async {
    String observation = "mission rejeté";
    int codeEtat = 8;
    bool result = await Parser().putData(numMission, codeEtat, observation);

    if (result) {
      DInfo.toastSuccess(" Refus de l'Approbation ");
      debugPrint("mission rejetée");
      notifFunction(numMission, codeAgent, "mission rejeter");
    } else {
      debugPrint("erreur de Connection ou saisie");
      DInfo.toastError(" Echec de l'approbation ");
    }
  }
}
