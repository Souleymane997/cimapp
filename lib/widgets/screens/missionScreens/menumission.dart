import 'package:cimapp/widgets/screens/missionScreens/approuvemission.dart';
import 'package:cimapp/widgets/screens/missionScreens/bugetisermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/cloturermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/consultermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/evaluermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/initiermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/payermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/validermission.dart';
import 'package:cimapp/widgets/screens/missionScreens/verifiermission.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as _getx;
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/slidepage.dart';

class MenuMissionPage extends StatefulWidget {
  const MenuMissionPage({Key? key}) : super(key: key);

  @override
  State<MenuMissionPage> createState() => _MenuMissionPageState();
}

class _MenuMissionPageState extends State<MenuMissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 8.0,
            ),
            ExpansionTileCard(
              baseColor: blanc(),
              expandedColor: blanc(),
              initiallyExpanded: true,
              leading: ImageIcon(
                const AssetImage("images/goal.png"),
                color: bleuClaire(),
                size: 20.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              elevation: 0.0,
              title: CustomText(
                "Workflow des missions",
                tex: 0.8,
                textAlign: TextAlign.left,
                color: bleuClaire(),
              ),
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 5.0,
                    ),
                    cardMission("Initier une mission", Icons.edit,
                        const InitierMissionPage()),
                    cardMission("Mission à approuver", Icons.touch_app,
                        const ApprouveMission()),
                    cardMission("Mission à budgétiser", Icons.local_atm,
                        const BudgetMission()),
                    cardMission("Mission à valider", Icons.check,
                        const ValiderMission()),
                    cardMission("Mission à payer", Icons.attach_money,
                        const PayerMission()),
                    cardMission("Mission à vérifier", Icons.verified,
                        const VerifierMission()),
                    cardMission("Mission à clôturer", Icons.close,
                        const CloturerMission()),
                    cardMission("Consultation d'une mission",
                        Icons.remove_red_eye, const ConsulterMission()),
                  ],
                )
              ],
            ),
            Container(
              height: 20.0,
            ),
            ExpansionTileCard(
              baseColor: blanc(),
              expandedColor: blanc(),
              initiallyExpanded: true,
              leading: Icon(
                Icons.turned_in_not,
                color: bleuClaire(),
                size: 20.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              elevation: 0.0,
              title: CustomText(
                "Evaluation des missions ",
                tex: 0.8,
                textAlign: TextAlign.left,
                color: bleuClaire(),
              ),
              children: <Widget>[
                Column(
                  children: [
                    cardMission("Faire une evaluation", Icons.event_note,
                        const EvaluerMission()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardMission(String option, IconData icon, Widget x) {
    return Column(
      children: [
        Container(
          height: 13.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
            );
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(left: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Icon(
                        icon,
                        color: gris(),
                        size: 25.0,
                      )),
                ),
              ],
            ),
            Container(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomText(
                          option,
                          tex: 1.0,
                          color: gris(),
                        ),
                      ),
                      SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: Icon(
                            Icons.chevron_right,
                            color: gris(),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
        Container(
          height: 13.0,
        ),
        const Divider(
          thickness: 1.0,
          height: 1.0,
          endIndent: 10,
          indent: 10,
        ),
      ],
    );
  }
}
