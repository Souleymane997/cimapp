// ignore: camel_case_types

import 'package:cimapp/modelsrequest/getresponse.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'custom_text.dart';
import 'slidepage.dart';

// ignore: camel_case_types
class infoNotif {
  String titre = '';
  String message = '';
  String date = '';
  late bool lu;

  infoNotif(this.titre, this.message, this.date, this.lu) {
    titre = titre;
    message = message;
    date = date;
    lu = lu;
  }
}

// ignore: camel_case_types
class infoParticpant {
  String nom = '';
  String prenom = '';
  String matricule = '';
  String service = '';
  String role = '';

  infoParticpant(
      this.nom, this.prenom, this.matricule, this.service, this.role) {
    nom = nom;
    prenom = prenom;
    matricule = matricule;
    service = service;
    role = role;
  }
}

// ignore: camel_case_types
class infoItineraire {
  String localite = '';
  int duree = 0;
  late poSition statut;

  infoItineraire(this.localite, this.duree, this.statut) {
    localite = localite;
    duree = duree;
    statut = statut;
  }
}

enum poSition { depart, escale, fin }

Widget cardWidget(BuildContext context, getReponse element, Widget x) {
  return Card(
    child: Padding(
      padding:
          const EdgeInsets.only(left: 0.5, right: 0.5, top: 2.5, bottom: 2.5),
      child: InkWell(
        onTap: () {
          debugPrint("vous avez cliqué sur ${element.id}");
          Navigator.of(context).push(
            SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
          );
        },
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  color: blanc(),
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
                                '${element.name}',
                                tex: 0.9,
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
                        '${element.email}',
                        tex: 0.6,
                        color: noir(),
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
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
                          '${element.phone}',
                          tex: 0.5,
                          color: gris(),
                          fontWeight: FontWeight.w100,
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
                          '${element.website}',
                          tex: 0.5,
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

Widget cardOption(
    String option, IconData icon, Widget x, BuildContext context) {
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
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                      chaine,
                      tex: 0.8,
                      color: noir(),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(content,
                          tex: 0.8, color: gris(), textAlign: TextAlign.right),
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

Widget detailWidget(BuildContext context, getReponse element) {
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
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomText(
                          '${element.email}',
                          textAlign: TextAlign.center,
                          tex: 1.4,
                        )),
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
                    "Type de mission        :   Mission a l'exterieur",
                    tex: 0.8,
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
                    "Objet de la mission   :   Formation ",
                    tex: 0.8,
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
                    "Motif de mission        :   Colloque",
                    tex: 0.8,
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
                    "Description                 :   ppppp ",
                    tex: 0.8,
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
                  tex: 1.0,
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
                      cardSimpleInfo(
                          "Svce. demandeur",
                          "Cabinet/Secrétariat Général/Direction Générale de l'Artisanat",
                          context),
                      cardSimpleInfo("Type ordre mission", "Groupé", context),
                      cardSimpleInfo("Exercice budgetaire", "2022", context),
                      cardSimpleInfo("Initiateur",
                          "BADOLO Boubié Séraphin - 111308 W", context),
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
                              tex: 1.1,
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
                              "Date début : 11/04/2022",
                              tex: 0.8,
                              color: gris(),
                            ),
                            Container(
                              height: 8.0,
                            ),
                            CustomText(
                              "Date fin : 18/04/2022",
                              tex: 0.8,
                              color: gris(),
                            ),
                            Container(
                              height: 8.0,
                            ),
                            CustomText(
                              "Date début : 11/04/2022",
                              tex: 0.8,
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
