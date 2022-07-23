// ignore: camel_case_types
import 'dart:async';
import 'dart:convert';

import 'package:cimapp/modelsrequest/getresponse.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../parser.dart';
import '../widgets/loginpage.dart';
import 'colors.dart';
import 'custom_text.dart';
import 'slidepage.dart';

notifFunction(int numMission, int codeAgent, String libelle) async {
  bool result =
      await Parser().postDataNotif(numMission,codeAgent,libelle);

  if (result) {
    //DInfo.toastNetral("effectuée");
    debugPrint("effectuée");
  } else {
    debugPrint("erreur");
    //DInfo.toastError(" Echec de l'approbation ");
  }
}

loadData(SharedPreferences saveDataUser) async {
  saveDataUser = await SharedPreferences.getInstance();
  String? repString = saveDataUser.getString('user');

  if (repString!.isNotEmpty) {
    Map<String, dynamic> map = jsonDecode(repString);
    GetLoginReponse reponseLogin = GetLoginReponse.fromJson(map);

    debugPrint(reponseLogin.nomPrenom);
  }
}

saveData(SharedPreferences saveDataUser, var R) async {
  saveDataUser = await SharedPreferences.getInstance();
  GetLoginReponse rep = GetLoginReponse();
  Map<String, dynamic> data = json.decode(R.body);
  rep = GetLoginReponse.fromJson(data);

  String repString = jsonEncode(rep); // la reponse du json en String
  saveDataUser.setString('user', repString);
  debugPrint(repString);
}

clearData(SharedPreferences saveDataUser) async {
  saveDataUser = await SharedPreferences.getInstance();
  saveDataUser.clear();
  debugPrint(" les données ont été effacées !!! ");
}

Widget cardWidget(BuildContext context, GetMissionUser element, Widget x) {
  return Card(
    child: Padding(
      padding:
          const EdgeInsets.only(left: 0.5, right: 0.5, top: 2.5, bottom: 2.5),
      child: InkWell(
        splashColor: Colors.black87.withOpacity(0.5),
        onTap: () {
          Timer(const Duration(milliseconds: 400), () {
            debugPrint("vous avez cliqué sur ${element.numMission}");
            Navigator.of(context).push(
              SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
            );
          });
        },
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: bleuClaire(),
                  ),
                ),
                child: Center(
                    child: ImageIcon(
                  const AssetImage("images/goal.png"),
                  color: bleuClaire(),
                )),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                'N° 00${element.numMission} || ${element.libelleMotifMission}',
                                tex: TailleText(context).soustitre,
                                color: noir(),
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        '-> ${element.descriptionMission} \n-> ${element.libelleStructure}',
                        tex: TailleText(context).contenu,
                        color: noir(),
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w300,
                      ),
                    ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(children: [
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: CustomText(
                          '${element.libelleEtat}',
                          tex: TailleText(context).mini,
                          color: bleuClaire(),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: CustomText(
                          '${element.libelleTypeMission} \n  Durée : ${element.dureeMission} jours',
                          tex: TailleText(context).mini,
                          color: gris(),
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ],
          ),
          // trailing: Text('More Info'),
        ),
      ),
    ),
  );
}

Widget cardButton(
    String iconChemin, String chaine, Widget x, BuildContext context) {
  return Card(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: grisee(), width: 1.0),
      ),
      child: InkWell(
        //highlightColor: Colors.black87.withOpacity(0.4),
        splashColor: Colors.black87.withOpacity(0.5),
        onTap: () {
          Timer(const Duration(milliseconds: 400), () {
            debugPrint("vous avez cliqué sur $chaine ");
            Navigator.of(context).push(
              SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
            );
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4125,
          padding:
              const EdgeInsets.only(left: 5, right: 5, bottom: 13, top: 13),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12)),
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
                  child: CustomText(chaine,
                      tex: TailleText(context).soustitre, color: noir()),
                ),
              ),
            ],
          ),
        ),
      ));
}

Widget cardOption(
    String option, IconData icon, Widget x, BuildContext context) {
  return Column(
    children: [
      Container(
        height: 13.0,
      ),
      InkWell(
        splashColor: Colors.black87.withOpacity(0.5),
        onTap: () {
          Timer(const Duration(milliseconds: 400), () {
            Navigator.of(context).push(
              SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
            );
          });
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
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
              const SizedBox(
                width: 5.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.612,
                child: Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        option,
                        tex: TailleText(context).soustitre,
                        color: gris(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.chevron_right,
                      color: gris(),
                    ),
                  )),
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

Widget cardSimpleInfo(String chaine, String content, BuildContext context) {
  return Column(
    children: [
      Container(
        height: 13.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.875,
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                      chaine,
                      tex: TailleText(context).contenu,
                      color: noir(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(content,
                          tex: TailleText(context).contenu,
                          color: gris(),
                          textAlign: TextAlign.right),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
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

Widget detailWidget(BuildContext context, GetMissionUser element) {
  return Column(
    children: [
      Stack(children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              color: bleuFonce(),
              child: Row(
                children: [
                  Flexible(
                      child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 8,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomText(
                              'Mission N° 2022/00${element.numMission}',
                              textAlign: TextAlign.center,
                              tex: TailleText(context).titre,
                            )),
                        Container(
                          height: 5,
                        ),
                        Card(
                          elevation: 5.0,
                          color: Colors.orangeAccent,
                          child: Container(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomText(
                                'Statut : ${element.libelleEtat}',
                                textAlign: TextAlign.center,
                                tex: TailleText(context).soustitre,
                              )),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.025,
              color: blanc(),
            )
          ],
        ),
      ]),
      Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          color: blanc(),
          child: Card(
            elevation: 3.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8.0,
                  ),
                  CustomText(
                    "Type de mission        :   ${element.libelleTypeMission}",
                    tex: TailleText(context).contenu,
                    color: gris(),
                  ),
                  Container(
                    height: 8.0,
                  ),
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Container(
                    height: 8.0,
                  ),
                  CustomText(
                    "Objet de la mission   :   ${element.objetMission}",
                    tex: TailleText(context).contenu,
                    color: gris(),
                  ),
                  Container(
                    height: 8.0,
                  ),
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Container(
                    height: 8.0,
                  ),
                  CustomText(
                    "Motif de mission       :   ${element.libelleMotifMission}",
                    tex: TailleText(context).contenu,
                    color: gris(),
                  ),
                  Container(
                    height: 8.0,
                  ),
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Container(
                    height: 8.0,
                  ),
                  CustomText(
                    "Description                :   ${element.descriptionMission} ",
                    tex: TailleText(context).contenu,
                    color: gris(),
                  ),
                  Container(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          )),
      Container(
        height: 10.0,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        color: blanc(),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  "Informations générales",
                  tex: TailleText(context).soustitre,
                  color: bleuClaire(),
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: blanc(),
              child: ExpansionTileCard(
                baseColor: blanc(),
                expandedColor: blanc(),
                initiallyExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                elevation: 3.0,
                title: CustomText(
                  "Informations",
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
                      cardSimpleInfo("Svce. demandeur",
                          element.libelleStructure.toString(), context),
                      cardSimpleInfo("Type ordre mission",
                          "${element.libelleType}", context),
                      cardSimpleInfo("Exercice budgetaire", "2022", context),
                      cardSimpleInfo(
                          "Initiateur",
                          "${element.nomPrenom} - ${element.matricule}",
                          context),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 13.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                color: blanc(),
                child: Card(
                  elevation: 3.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              "Periode ",
                              tex: TailleText(context).soustitre,
                              color: bleuClaire(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          child: VerticalDivider(
                            color: noir(),
                            thickness: 1,
                            indent: 5,
                            endIndent: 0,
                            width: 10,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 8.0,
                            ),
                            CustomText(
                              "Date début : ${element.dateDepartPrevue}",
                              tex: TailleText(context).contenu,
                              color: gris(),
                            ),
                            Container(
                              height: 8.0,
                            ),
                            CustomText(
                              "Date fin       : ${element.dateRetourPrevue}",
                              tex: TailleText(context).contenu,
                              color: gris(),
                            ),
                            Container(
                              height: 8.0,
                            ),
                            CustomText(
                              "Durée          : ${element.dureeMission} (en Jours)",
                              tex: TailleText(context).contenu,
                              color: gris(),
                            ),
                            Container(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              height: 10.0,
            ),
          ],
        ),
      ),
      Container(
        height: 70.0,
      ),
    ],
  );
}

Widget cardProfil(String option, IconData icon, BuildContext context,
    GetLoginReponse? reponseLogin) {
  return Column(
    children: [
      Container(
        height: 13.0,
      ),
      InkWell(
        splashColor: Colors.black87.withOpacity(0.5),
        onTap: () {
          Timer(const Duration(milliseconds: 10), () async {
            return await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                TextEditingController nomPrenom = TextEditingController();
                TextEditingController matricule = TextEditingController();
                TextEditingController genre = TextEditingController();

                nomPrenom.text = (reponseLogin!.nomPrenom ?? " nom prenom ");
                matricule.text = (reponseLogin.matricule ?? " 0000X");
                genre.text = (reponseLogin.genre ?? " M ");

                return SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  backgroundColor: blanc(),
                  title: CustomText(
                    "Mes Informations",
                    color: bleuClaire(),
                    tex: TailleText(context).titre,
                    textAlign: TextAlign.left,
                  ),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        children: [
                          Divider(
                            thickness: 1.0,
                            height: 2.0,
                            color: grisee(),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextField(
                                  enabled: false,
                                  controller: nomPrenom,
                                  decoration: const InputDecoration(
                                      labelText: "nomPrenom",
                                      prefixIcon: Icon(Icons.person)),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextField(
                                  enabled: false,
                                  controller: matricule,
                                  decoration: const InputDecoration(
                                      labelText: "Matricule",
                                      prefixIcon: Icon(Icons.numbers_sharp)),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: TextField(
                                  enabled: false,
                                  controller: genre,
                                  decoration: InputDecoration(
                                      labelText: "Genre",
                                      prefixIcon: Icon((genre.text == "M")
                                          ? Icons.male
                                          : Icons.female)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: ElevatedButton(
                            child: CustomText("retour",
                                color: blanc(),
                                tex: TailleText(context).contenu),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7.0, vertical: 1.0),
                              primary: bleuClaire(),
                              onPrimary: bleuClaire(),
                              shadowColor: bleuFonce(),
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            );
          });
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
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
              const SizedBox(
                width: 5.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.612,
                child: Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        option,
                        tex: TailleText(context).soustitre,
                        color: gris(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.chevron_right,
                      color: gris(),
                    ),
                  )),
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

Widget cardLogout(String option, IconData icon, BuildContext context,
    SharedPreferences? loginData) {
  return Column(
    children: [
      Container(
        height: 13.0,
      ),
      InkWell(
        onTap: () async {
          return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                contentPadding: const EdgeInsets.only(top: 10.0),
                title: CustomText(
                  "Se déconnecter",
                  color: bleuClaire(),
                  tex: TailleText(context).titre,
                  textAlign: TextAlign.left,
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      thickness: 1.0,
                      height: 2.0,
                      color: grisee(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: CustomText(
                              "Etes-vous sûr de vouloir vous déconnecter?",
                              color: noir(),
                              tex: TailleText(context).soustitre,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      child: CustomText("NON",
                          color: bleuClaire(),
                          tex: TailleText(context).contenu),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 1.0),
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        shadowColor: bleuFonce(),
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        //login();
                      }),
                  const SizedBox(width: 7.5),
                  ElevatedButton(
                      child: CustomText("OUI",
                          color: blanc(), tex: TailleText(context).contenu),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 1.0),
                        primary: bleuClaire(),
                        onPrimary: bleuClaire(),
                        shadowColor: bleuFonce(),
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      onPressed: () {
                        loginData!.setBool('login', true);
                        Navigator.of(context).push(
                          SlideRightRoute(
                              child: const LoginPage(),
                              page: const LoginPage(),
                              direction: AxisDirection.right),
                        );
                      }),
                  const SizedBox(width: 2.5),
                ],
              );
            },
          );
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
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
              const SizedBox(
                width: 5.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.612,
                child: Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        option,
                        tex: TailleText(context).soustitre,
                        color: gris(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.chevron_right,
                      color: gris(),
                    ),
                  )),
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

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,

    // this.selecteItems,
  }) : super(key: key);

  // ignore: unused_field

  // List<String>? selecteItems;
  // List<String>? get selectedItems => selecteItems;
  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  bool _objetIsSelected = false;
  bool _montantIsSelected = false;
  bool _dateIsSelected = false;

  List<String>? selecteItems;
  List<String>? get selectedItems => selecteItems;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      alignment: Alignment.topCenter,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: ChoiceChip(
                  label: const Text('Objet'),
                  selected: _objetIsSelected,
                  selectedColor: Colors.amber,
                  onSelected: (newboolvalue) {
                    setState(() {
                      _objetIsSelected = newboolvalue;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: ChoiceChip(
                  selectedColor: Colors.amber,
                  label: const Text('Montant'),
                  selected: _montantIsSelected,
                  onSelected: (newboolvalue) {
                    setState(() {
                      _montantIsSelected = newboolvalue;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                child: ChoiceChip(
                  label: const Text('Date'),
                  selectedColor: Colors.amber,
                  selected: _dateIsSelected,
                  onSelected: (newboolvalue) {
                    setState(() {
                      _dateIsSelected = newboolvalue;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
