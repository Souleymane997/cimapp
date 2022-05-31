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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          " N° 222222222 ",
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
                                  "2022/0133/MINISTERE DU DEVELOPPEMENT INDUSTRIELDU COMMERCE, DE L'ARTISANAT ET DES PETITES ET MOYENNES ENTREPRISES/DGA ${(widget.name.isNotEmpty) ? widget.name : 'soloolol'}",
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
                          "Objet de la mission   :   Formation ",
                          tex: 1.0,
                          color: gris(),
                        ),
                        Container(
                          height: 8.0,
                        ),
                        CustomText(
                          "Motif de mission        :   Colloque",
                          tex: 1.0,
                          color: gris(),
                        ),
                        Container(
                          height: 8.0,
                        ),
                        CustomText(
                          "Description                 :   ppppp ",
                          tex: 1.0,
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
                leading: Icon(
                  Icons.attach_money,
                  color: bleuClaire(),
                  size: 20.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                elevation: 0.0,
                title: CustomText(
                  "Gestion des Frais",
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
                    width: MediaQuery.of(context).size.width,
                    color: blanc(),
                    child: ExpansionTileCard(
                      baseColor: blanc(),
                      expandedColor: blanc(),
                      initiallyExpanded: true,
                      leading: Icon(
                        Icons.info_outline ,
                        color: bleuClaire(),
                        size: 20.0,
                      ),
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
                            cardSimpleInfo(
                                "Svce. demandeur", "Cabinet/Secrétariat Général/Direction Générale de l'Artisanat"),
                            cardSimpleInfo("Type ordre mission", "Groupé"),
                            cardSimpleInfo("Exercice budgetaire", "2022"),
                            cardSimpleInfo("Initiateur", "BADOLO Boubié Séraphin - 111308 W"),
                          ],
                        )
                      ],
                    ),
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
                        tex: 1.0,
                        color: noir(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Flexible(
                      child: CustomText(
                        " $money F CFA",
                        tex: 1.0,
                        color: bleuClaire(),
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



  Widget cardSimpleInfo(String chaine, String content ,) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomText(
                        "$chaine  : ",
                        tex: 0.8,
                        color: noir(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(width: 10.0,),
                    Flexible(
                      child: CustomText(
                        " $content ",
                        tex: 0.8,
                        color: gris(),
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
}
