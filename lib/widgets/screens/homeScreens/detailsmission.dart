import 'dart:math';

import 'package:cimapp/models/infos.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

// ignore: must_be_immutable
class DetailsMission extends StatefulWidget {
  final String name;

  const DetailsMission({Key? key, required this.name}) : super(key: key);

  @override
  State<DetailsMission> createState() => _DetailsMissionState();
}

class _DetailsMissionState extends State<DetailsMission> {
  List<infoParticpant> list = [
    infoParticpant(
        "BADOLO",
        "Boubié Séraphin",
        " 111308 W",
        "Cabinet / Secrétariat Général / Direction Générale de l'Artisanat",
        "Chef de mission"),
    infoParticpant(
        "BADOLO",
        "Boubié Séraphin",
        " 111308 W",
        "Cabinet / Secrétariat Général / Direction Générale de l'Artisanat",
        "Participant"),
    infoParticpant(
        "BADOLO",
        "Boubié Séraphin",
        " 111308 W",
        "Cabinet / Secrétariat Général / Direction Générale de l'Artisanat",
        "Participant"),
    infoParticpant(
        "BADOLO",
        "Boubié Séraphin",
        " 111308 W",
        "Cabinet / Secrétariat Général / Direction Générale de l'Artisanat",
        "Participant"),
  ];

  List<infoItineraire> l = [
    infoItineraire("Ouagadougou", 3, poSition.depart),
    infoItineraire("Koudougou", 2, poSition.escale),
    infoItineraire("Manga", 5, poSition.escale),
    infoItineraire("Bobo Dioulasso", 2, poSition.fin),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          "Details Mission ",
          tex: 1.3,
        ),
        centerTitle: true,
        backgroundColor: bleuFonce(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                            child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomText(
                                  "  N° 22352 2022/0133/MINISTERE DU DEVELOPPEMENT INDUSTRIELDU COMMERCE, DE L'ARTISANAT ET DES PETITES ET MOYENNES ENTREPRISES/DGA ${(widget.name.isNotEmpty) ? widget.name : 'soloolol'}",
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    color: blanc(),
                  )
                ],
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.13,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                      border: Border.all(
                        color: blanc(),
                        width: 1,
                      ),
                    ),
                    width: 40.0,
                    height: 40.0,
                    child: Center(
                      child: CustomText(
                        "Payé",
                        tex: 0.8,
                        color: blanc(),
                      ),
                    )),
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
              height: 8.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              color: blanc(),
              child: ExpansionTileCard(
                baseColor: blanc(),
                expandedColor: blanc(),
                initiallyExpanded: true,
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                elevation: 0.0,
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    "Gestion des Frais",
                    tex: 1.0,
                    textAlign: TextAlign.left,
                    color: bleuClaire(),
                  ),
                ),
                children: <Widget>[
                  Container(
                    height: 10.0,
                  ),
                  Column(
                    children: [
                      cardSimple("Indemnités des frais de Mission", "418 000"),
                      cardSimple("Dépenses Totales", "418 000"),
                      cardSimple("Total des Paiements", "532 000"),
                    ],
                  )
                ],
              ),
            ),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      elevation: 0.0,
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
                            cardSimpleInfo("Svce. demandeur",
                                "Cabinet/Secrétariat Général/Direction Générale de l'Artisanat"),
                            cardSimpleInfo("Type ordre mission", "Groupé"),
                            cardSimpleInfo("Exercice budgetaire", "2022"),
                            cardSimpleInfo("Initiateur",
                                "BADOLO Boubié Séraphin - 111308 W"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                    height: 12.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: blanc(),
                    child: ExpansionTileCard(
                      baseColor: blanc(),
                      expandedColor: blanc(),
                      initiallyExpanded: true,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      elevation: 0.0,
                      title: CustomText(
                        "Budget",
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
                            cardSimpleInfo("Prog. activité", "Artisanat"),
                            cardSimpleInfo("Section", "MDICAPME"),
                            cardSimpleInfo("Prog/Chapit",
                                "1016000311 / Direction Générale de l'Artisanat"),
                            cardSimpleInfo("Action/Article",
                                "06905 / DGA / promotion commerciale des produits de l'artisanat"),
                            cardSimpleInfo("Activité/Parag",
                                "0690509 / appuyer les activités du village artisanal de Kaya"),
                            cardSimpleInfo("Action/Article",
                                "639 /DGA/ subvention et autres catégories"),
                          ],
                        )
                      ],
                    ),
                  ),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      elevation: 0.0,
                      title: CustomText(
                        " Objectif ",
                        tex: 1.0,
                        textAlign: TextAlign.left,
                        color: bleuClaire(),
                      ),
                      children: <Widget>[
                        Container(
                          height: 10.0,
                        ),
                        tableObjectif(),
                      ],
                    ),
                  ),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      elevation: 0.0,
                      title: CustomText(
                        "Participants",
                        tex: 1.0,
                        textAlign: TextAlign.left,
                        color: bleuClaire(),
                      ),
                      children: <Widget>[
                        Container(
                          height: 10.0,
                        ),
                        tableParticipant(list),
                      ],
                    ),
                  ),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(0.0)),
                      elevation: 0.0,
                      title: CustomText(
                        "Itineraire",
                        tex: 1.0,
                        textAlign: TextAlign.left,
                        color: bleuClaire(),
                      ),
                      children: <Widget>[
                        Container(
                          height: 10.0,
                        ),
                        tableItineraire(l),
                        Container(
                          height: 10.0,
                        ),
                        Container(
                            color: bleuClaire().withOpacity(0.4),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: CustomText(
                                      "Distance (en km )",
                                      tex: 0.8,
                                      color: noir(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Flexible(
                                    child: CustomText(
                                      "888 ",
                                      tex: 0.8,
                                      color: noir(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ])),
                      ],
                    ),
                  ),
                  Container(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardSimple(String chaine, String money) {
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
                width: MediaQuery.of(context).size.width * 0.75,
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
                        child: CustomText(
                          " $money F CFA",
                          tex: 0.8,
                          color: bleuClaire(),
                        ),
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

  Widget cardSimpleInfo(
    String chaine,
    String content,
  ) {
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
                            tex: 0.8,
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



  tableObjectif() {
    setColor([bool even = true]) {
      return BoxDecoration(
        color: even ? bleuFonce().withOpacity(0.4) : blanc(),
        shape: BoxShape.rectangle,
      );
    }

    final rows = <TableRow>[];
    rows.add(
      TableRow(children: [
        Column(children: [
          CustomText(
            'Objectif',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Objectif Atteint',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Observations',
            tex: 0.9,
            color: noir(),
          )
        ]),
      ]),
    );

    for (var i = 0; i < 5; i++) {
      rows.add(TableRow(
          decoration: setColor(i % 2 == 0),
          children: [randomText(), randomText(), randomText()]));
    }

    return Table(
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 0.5),
        children: rows);
  }

  tableParticipant(List<infoParticpant> l) {
    setColor([bool even = true]) {
      return BoxDecoration(
        color: even ? bleuFonce().withOpacity(0.4) : blanc(),
        shape: BoxShape.rectangle,
      );
    }

    final rows = <TableRow>[];
    rows.add(
      TableRow(children: [
        Column(children: [
          CustomText(
            'Nom & Prenom',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Matricule',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Services',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Rôle',
            tex: 1.0,
            color: noir(),
          )
        ]),
      ]),
    );

    for (var i = 0; i < l.length; i++) {
      rows.add(TableRow(decoration: setColor(i % 2 == 0), children: [
        Column(children: [
          CustomText(
            " ${l[i].nom}  ${l[i].prenom} ",
            tex: 0.8,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            l[i].matricule,
            tex: 0.8,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            l[i].service,
            tex: 0.8,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            l[i].role,
            tex: 0.8,
            color: noir(),
          )
        ])
      ]));
    }

    return Table(
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 0.5),
        children: rows);
  }

  tableItineraire(List<infoItineraire> l) {
    setColor([bool even = true]) {
      return BoxDecoration(
        color: even ? bleuFonce().withOpacity(0.4) : blanc(),
        shape: BoxShape.rectangle,
      );
    }

    final rows = <TableRow>[];
    rows.add(
      TableRow(children: [
        Column(children: [
          CustomText(
            'Localité',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Depart',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Destination',
            tex: 0.9,
            color: noir(),
          )
        ]),
        Column(children: [
          CustomText(
            'Durée(en jours)',
            tex: 1.0,
            color: noir(),
          )
        ]),
      ]),
    );

    for (var i = 0; i < l.length; i++) {
      rows.add(TableRow(decoration: setColor(i % 2 == 0), children: [
        Column(children: [
          Center(
            child: CustomText(
              " ${l[i].localite} ",
              tex: 0.8,
              color: noir(),
            ),
          )
        ]),
        Column(children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                color: colorStatutDebut(l[i].statut),
                border: Border.all(
                  width: 1,
                  color: noir(),
                )),
          )
        ]),
        Column(children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                color: colorStatutFin(l[i].statut),
                border: Border.all(
                  width: 1,
                  color: noir(),
                )),
          )
        ]),
        Column(children: [
          Center(
            child: CustomText(
              " ${l[i].duree} ",
              tex: 0.8,
              color: noir(),
            ),
          )
        ])
      ]));
    }

    return Table(
        border: TableBorder.all(
            color: Colors.black, style: BorderStyle.solid, width: 0.5),
        children: rows);
  }

  Color colorStatutDebut(poSition x) {
    if (x == poSition.depart) {
      return Colors.blue;
    }

    return gris();
  }

  Color colorStatutFin(poSition x) {
    if (x == poSition.fin) {
      return Colors.red;
    }

    return gris();
  }

  randomText() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(Random().nextInt(500).toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center));
  }
}
