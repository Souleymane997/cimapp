import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../models/slidepage.dart';
import 'detailsmission.dart';

// ignore: must_be_immutable
class ListeMission extends StatefulWidget {
  final int i ;
  const ListeMission({Key? key, required this.i}) : super(key: key);

  @override
  State<ListeMission> createState() => _ListeMissionState();
}

class _ListeMissionState extends State<ListeMission> {
  String titre = '';

  List list = [
    infoMission("PPPPPPPo", "DSA", 2, "Mr Soma"),
    infoMission("AAAAA", "DSI", 2, "Mr Soma"),
    infoMission("PPPPPPP", "DSA", 2, "Mr Dembele"),
    infoMission("Resencement", "DSO", 5, "Mr Antoine"),
    infoMission("PPPPPPP", "DSA", 2, "Mr Soma"),
  ];


  @override
  void initState() {
    titre = formVerif(widget.i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(titre),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          color: blanc(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 15.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(titre,
                    tex: 1.2, color: bleuClaire(), textAlign: TextAlign.left),
              ),
              Container(
                height: 20.0,
              ),
              cardMission(list[0]),
              cardMission(list[1]),
              cardMission(list[2]),
              cardMission(list[0]),
              cardMission(list[1]),
              cardMission(list[2]),
              Container(
                height: 15.0,
              ),
            ],
          )),
    );
  }

  Widget cardMission(infoMission element) {
    return Column(
      children: [
        Container(
          height: 10.0,
        ),
        InkWell(
          onTap: () {
            debugPrint("vous avez cliqué sur ${element.direction}");
            Navigator.of(context).push(
              SlideRightRoute(
                  child: DetailsMission(name: element.direction.toString()),
                  page: DetailsMission(name: element.direction.toString()),
                  direction: AxisDirection.left),
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
                  elevation: 5.0,
                  child: Container(
                      width: 60.0,
                      height: 60.0,
                      padding: const EdgeInsets.all(12),
                      child: ImageIcon(
                        const AssetImage("images/goal.png"),
                        color: bleuClaire(),
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
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          element.titre,
                          tex: 1.0,
                          color: noir(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 8.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          "Direction : ${element.direction} ",
                          tex: 0.7,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          "Initiateur : ${element.initiateur}",
                          tex: 0.7,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomText(
                          "Durée: ${element.duree} mois",
                          tex: 0.7,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 10.0,
            ),
          ]),
        ),
        Container(
          height: 10.0,
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

  String formVerif(int i) {
    switch (i) {
      case 1:
         return "Liste des Missions";
       
      case 2:
        return "Missions Terminées";
        
      case 3:
        return "Missions en Cours ";
       
      case 4:
        return "Missions Validées ";
      default : 
        return '' ;
    }
  }

}
