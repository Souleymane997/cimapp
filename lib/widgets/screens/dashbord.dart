import 'package:cimapp/models/colors.dart';
import 'package:cimapp/widgets/screens/homeScreens/listemission.dart';
import 'package:cimapp/widgets/screens/userScreens/user.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import '../../models/custom_text.dart';
import '../../models/infos.dart';
import '../../models/slidepage.dart';
import '../../modelsrequest/getresponse.dart';
import '../../parser.dart';
import 'homeScreens/detailsmission.dart';
import 'missionScreens/consultermission.dart';

class DashbordPage extends StatefulWidget {
  const DashbordPage({Key? key}) : super(key: key);

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  final GlobalKey cardA = GlobalKey();
  final GlobalKey cardB = GlobalKey();

  Parser parser = Parser();
  List<getReponse> feed = [];
  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    load();
    super.initState();
  }

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
                            cardButton(
                                "images/list.png",
                                "Liste des Missions",
                                const ListeMission(
                                  x: 1,
                                ),
                                context),
                            cardButton("images/task.png", "Mission Terminées",
                                const ListeMission(x: 2), context),
                          ]),
                      Container(height: 15.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            cardButton(
                                "images/rotate.png",
                                "Missions en Cours",
                                const ListeMission(
                                  x: 3,
                                ),
                                context),
                            cardButton(
                                "images/termine.png",
                                "Missions Validées",
                                const ListeMission(
                                  x: 4,
                                ),
                                context),
                          ]),
                      Container(height: 10.0),
                    ],
                  )
                ],
              ),
              Container(
                height: 10.0,
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
                  "MES MISSIONS RECENTES ",
                  tex: 1.0,
                  textAlign: TextAlign.left,
                  color: bleuClaire(),
                ),
                children: <Widget>[
                  Container(
                    height: 3.0,
                  ),
                  loadFeedWidget(),
                ],
              ),
            ],
          )),
    );
  }

  load() async {
    List<getReponse> result = await Parser().loadFeed();
    setState(() {
      feed = result;
    });
  }

  Widget loadFeedWidget() {
    if (feed.isNotEmpty) {
      int long = feed.length;
      
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            cardWidget(context, feed[long - 1] , ConsulterMission(element:feed[long - 1] ) ),
            const SizedBox(
              height: 5.0,
            ),
            cardWidget(context, feed[long - 2], ConsulterMission(element:feed[long - 2] )),
            const SizedBox(
              height: 5.0,
            ),
            cardWidget(context, feed[long - 3] , ConsulterMission(element:feed[long - 3] )),
            const SizedBox(
              height: 5.0,
            ),
            cardWidget(context, feed[long - 4] ,ConsulterMission(element:feed[long - 4] )),
            const SizedBox(
              height: 5.0,
            ),
            cardWidget(context, feed[long - 5], ConsulterMission(element:feed[long - 5] )),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
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
}
