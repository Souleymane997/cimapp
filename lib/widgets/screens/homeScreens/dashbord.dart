import 'package:cimapp/models/colors.dart';
import 'package:cimapp/widgets/screens/homeScreens/detailsmission.dart';
import 'package:cimapp/widgets/screens/homeScreens/listemission.dart';
import 'package:cimapp/widgets/screens/userScreens/user.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../models/slidepage.dart';

class DashbordPage extends StatefulWidget {
  const DashbordPage({Key? key}) : super(key: key);

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  final GlobalKey cardA = GlobalKey();
  final GlobalKey cardB = GlobalKey();
  late infoMission index;

  List list = [
    infoMission("PPPPPPPo", "DSA", 2, "Mr Soma"),
    infoMission("AAAAA", "DSI", 2, "Mr Soma"),
    infoMission("PPPPPPP", "DSA", 2, "Mr Dembele"),
    infoMission("Resencement", "DSO", 5, "Mr Antoine"),
    infoMission("PPPPPPP", "DSA", 2, "Mr Soma"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                backGround(),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(height: 20.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: CustomText(
                                        "Bienvenue , ",
                                        tex: 0.8,
                                        fontWeight: FontWeight.normal,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      height: 5.0,
                                    ),
                                    CustomText(
                                      "Souleymane ZONGO ",
                                      tex: 1.2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    debugPrint("user");
                                    Navigator.of(context).push(
                                      SlideRightRoute(
                                          child: const UserPage(),
                                          page: const UserPage(),
                                          direction: AxisDirection.up),
                                    );
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.account_circle_rounded,
                                      color: Colors.orangeAccent,
                                      size: 40.0,
                                    ),
                                  ),
                                )
                              ]),
                          Container(height: 20.0),
                          Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  color: bleuClaire(),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: ImageIcon(
                                              const AssetImage(
                                                  "images/goal.png"),
                                              size: 40,
                                              color: blanc(),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText("Nouvelle Mission",
                                                tex: 1.2,
                                                fontWeight: FontWeight.bold),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Divider(
                                            color: blanc(),
                                            thickness: 1.0,
                                            height: 1.0,
                                            endIndent: 10,
                                            indent: 10,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText("Direction : DSA ",
                                              tex: 0.8),
                                          Container(height: 7.0),
                                          CustomText("Durée : 2 mois",
                                              tex: 0.8),
                                          Container(height: 7.0),
                                          CustomText("Initiateur : Mr SOMA",
                                              tex: 0.8),
                                        ]),
                                  ]),
                            ),
                          )
                        ]),
                  ),
                ),
              ]),
              ExpansionTileCard(
                baseColor: blanc(),
                expandedColor: blanc(),
                initiallyExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                key: cardA,
                elevation: 0.0,
                title: CustomText(
                  "CONSULTATION DE MISSION",
                  tex: 1.0,
                  textAlign: TextAlign.left,
                  color: bleuClaire(),
                ),
                children: <Widget>[
                  Container(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            cardButton("images/list.png", "Liste des Missions", const ListeMission(i:1,)),
                            cardButton("images/task.png", "Mission Terminées", const ListeMission(i:2,)),
                          ]),
                      Container(height: 15.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            cardButton(
                                "images/rotate.png", "Missions en Cours" , const ListeMission(i:3,)),
                            cardButton(
                                "images/termine.png", "Missions Validées", const ListeMission(i:4,)),
                          ]),
                      Container(height: 10.0),
                    ],
                  )
                ],
              ),
              Container(
                height: 10.0,
              ),
              ExpansionTileCard(
                baseColor: blanc(),
                expandedColor: blanc(),
                initiallyExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                key: cardB,
                elevation: 0.0,
                title: CustomText(
                  "CONSULTATION DE MISSION",
                  tex: 1.0,
                  textAlign: TextAlign.left,
                  color: bleuClaire(),
                ),
                children: <Widget>[
                  Container(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      cardMission(list[0]),
                      cardMission(list[1]),
                      cardMission(list[2]),
                    ],
                  )
                ],
              ),
              Container(
                height: 10.0,
              ),
            ],
          )),
    );
  }

  Widget cardButton(
    String iconChemin,
    String chaine,
    Widget x
  ) {
    return Card(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: grisee(), width: 1.0),
        ),
        child: InkWell(
          onTap: () {
            debugPrint("vous avez cliqué sur $chaine ");
            Navigator.of(context).push(
              SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            padding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 13, top: 13),
            decoration: BoxDecoration(
                color: blanc(), borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ImageIcon(
                    AssetImage(iconChemin),
                    size: 30,
                    color: bleuClaire(),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: CustomText(chaine, tex: 0.9, color: noir()),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget backGround() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            color: bleuFonce(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            color: blanc(),
          ),
        ],
      ),
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
              SlideRightRoute(child: DetailsMission(name: element.direction.toString()), page: DetailsMission(name: element.direction.toString()), direction: AxisDirection.left),
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
}
