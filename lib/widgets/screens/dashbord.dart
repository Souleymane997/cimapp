import 'dart:convert';

import 'package:cimapp/models/colors.dart';
import 'package:cimapp/widgets/screens/homeScreens/listemission.dart';
import 'package:cimapp/widgets/screens/userScreens/user.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/bg.dart';
import '../../models/custom_text.dart';
import '../../models/infos.dart';
import '../../models/slidepage.dart';
import '../../modelsrequest/getresponse.dart';
import '../../parser.dart';
import 'missionScreens/consultermission.dart';
import 'dart:async';

class DashbordPage extends StatefulWidget {
  const DashbordPage({Key? key}) : super(key: key);

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  final GlobalKey cardA = GlobalKey();
  final GlobalKey cardB = GlobalKey();

  late SharedPreferences loginData;
  late SharedPreferences saveDataUser;
  late GetLoginReponse reponseLogin;

  int lonG = 1;

  late bool connect;
  String nomPrenom = " Prenom nom";
  int id = 0;

  Parser parser = Parser();
  List<GetMissionUser> feed = [];
  // ignore: prefer_typing_uninitialized_variables

  loadData() async {
    loginData = await SharedPreferences.getInstance();
    saveDataUser = await SharedPreferences.getInstance();

    String? repString = saveDataUser.getString('user');
    bool? b = loginData.getBool('login');

    if (repString!.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(repString);
      reponseLogin = GetLoginReponse.fromJson(map);
      nomPrenom = reponseLogin.nomPrenom!;
      id = reponseLogin.codeAgent!;

      debugPrint("$b");
    }
  }

  @override
  void initState() {
    connect = true;
    load(id);
    loadData();
    callme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refrech,
      child: Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(children: [
              backGroundblanc(context),
              Column(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: CustomText(
                                            "Bienvenue , ",
                                            tex: TailleText(context).contenu,
                                            fontWeight: FontWeight.normal,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          height: 5.0,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: CustomText(
                                            nomPrenom.capitalize,
                                            tex: TailleText(context).titre,
                                            fontWeight: FontWeight.normal,
                                          ),
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
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    SlideRightRoute(
                                        child:
                                            ConsulterMission(element: feed[0]),
                                        page:
                                            ConsulterMission(element: feed[0]),
                                        direction: AxisDirection.left),
                                  );
                                },
                                child: Card(
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height *
                                        0.23,
                                    padding: const EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        color: bleuClaire(),
                                        borderRadius:
                                            BorderRadius.circular(12)),
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
                                                  CustomText(
                                                      (feed.isNotEmpty)
                                                          ? "N°00${feed[0].numMission!} || ${feed[0].libelleMotifMission}"
                                                          : "Nouvelle Mission",
                                                      tex: TailleText(context)
                                                          .titre,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Container(
                                                    height: 2,
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(30, 0, 0, 0),
                                                    child: Card(
                                                      elevation: 3.0,
                                                      color:
                                                          Colors.orangeAccent,
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          child: CustomText(
                                                            (feed.isNotEmpty)
                                                                ? 'Statut : ${feed[0].libelleEtat}'
                                                                : 'Statut : En attente',
                                                            textAlign: TextAlign
                                                                .center,
                                                            tex: TailleText(
                                                                    context)
                                                                .contenu,
                                                          )),
                                                    ),
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
                                                  height: 8,
                                                ),
                                                CustomText(
                                                    (feed.isNotEmpty)
                                                        ? "Direction :${feed[0].sigleStructure!}"
                                                        : "Direction : DSA ",
                                                    tex: TailleText(context)
                                                        .contenu),
                                                Container(height: 5.0),
                                                CustomText(
                                                    (feed.isNotEmpty)
                                                        ? "Durée : ${feed[0].dureeMission!} jours || Debut : ${feed[0].dateDepartPrevue!} "
                                                        : "Durée : 20 jours || Debut : 01/01/2022",
                                                    tex: TailleText(context)
                                                        .contenu),
                                                Container(height: 5.0),
                                                CustomText(
                                                    (feed.isNotEmpty)
                                                        ? "Objet Mission : ${feed[0].objetMission}"
                                                        : "Objet Mission : Formation",
                                                    tex: TailleText(context)
                                                        .contenu),
                                                Container(height: 4.0),
                                              ]),
                                        ]),
                                  ),
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
                      tex: TailleText(context).soustitre,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cardButton(
                                    "images/list.png",
                                    "Liste des Missions",
                                    ListeMission(x: 0, id: id),
                                    context),
                                cardButton(
                                    "images/task.png",
                                    "Mission Terminées",
                                    ListeMission(x: 7, id: id),
                                    context),
                              ]),
                          Container(height: 15.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cardButton(
                                    "images/rotate.png",
                                    " Missions Initiées",
                                    ListeMission(x: 1, id: id),
                                    context),
                                cardButton(
                                    "images/termine.png",
                                    "Missions Validées",
                                    ListeMission(x: 6, id: id),
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
                      tex: TailleText(context).soustitre,
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
              ),
            ])),
      ),
    );
  }

  load(int id) async {
    List<GetMissionUser> result = await Parser().loadFeed(id: id);
    setState(() {
      feed = result;
      lonG = feed.length;
    });
  }

  Future refrech() async {
    await Future.delayed(const Duration(seconds: 1));
    feed.clear();
    initState();
    callme();
  }

  Widget loadFeedWidget() {
    if (feed.isNotEmpty) {
      int long = feed.length;

      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            (long > 1)
                ? cardWidget(
                    context, feed[1], ConsulterMission(element: feed[1]))
                : cPage(" Oups !! La liste est vide ..."),
            const SizedBox(
              height: 5.0,
            ),
            (long > 2)
                ? cardWidget(
                    context, feed[2], ConsulterMission(element: feed[2]))
                : const SizedBox(
                    height: 0.0,
                    width: 0.0,
                  ),
            const SizedBox(
              height: 5.0,
            ),
            (long > 3)
                ? cardWidget(
                    context, feed[3], ConsulterMission(element: feed[3]))
                : const SizedBox(
                    height: 0.0,
                    width: 0.0,
                  ),
            const SizedBox(
              height: 5.0,
            ),
            (long > 4)
                ? cardWidget(
                    context, feed[4], ConsulterMission(element: feed[4]))
                : const SizedBox(
                    height: 0.0,
                    width: 0.0,
                  ),
            const SizedBox(
              height: 5.0,
            ),
            (long > 5)
                ? cardWidget(
                    context, feed[5], ConsulterMission(element: feed[5]))
                : const SizedBox(
                    height: 0.0,
                    width: 0.0,
                  ),
            const SizedBox(
              height: 5.0,
            ),
          ],
        ),
      );
    } else {
      return (connect)
          ? nPage()
          : cPage(" Pas de Connection !! Reessayer SVP ...");
    }
  }

//* fonction pour changer de page
  Widget nPage() {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      color: bleuClaire().withOpacity(0.2),
      child: Column(
        children: [
          Container(
            height: 8.0,
          ),
          const CircularProgressIndicator(),
          Container(
            height: 8.0,
          ),
          CustomText("Recuperation des données en cours ?",
              color: gris(), tex: TailleText(context).contenu),
          Container(
            height: 8.0,
          ),
        ],
      ),
    ));
  }

  //* fonction pour changer de page
  Widget cPage(String message) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.orangeAccent.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Icon(
                  Icons.warning,
                  color: gris(),
                  size: 50.0,
                )),
          ),
          Container(
            height: 15.0,
          ),
          CustomText(message,
              color: gris(), tex: TailleText(context).soustitre),
          Container(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  callme() async {
    Timer(const Duration(seconds: 5), () {
      load(id);
    });

    Timer(const Duration(seconds: 30), () {
      setState(() {
        connect = false;
      });
    });
  }

  Widget backGround() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.175,
            color: bleuFonce(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.135,
            color: blanc(),
          ),
        ],
      ),
    );
  }
}
