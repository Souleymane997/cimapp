import 'package:cimapp/models/infos.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({Key? key}) : super(key: key);

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  List listLu = [
    infoNotif(
        "Buy Airtime",
        "bonjour souleymane , j espere que vous allez bien . vous etes invité sur une mission qui aura lieu le 03/10/2022 a manga",
        "22 mai 2022 , 08:15 ",
        true),
    infoNotif(
        "Buy Airtime",
        "bonjour souleymane , j espere que vous allez bien . vous etes invité sur une mission qui aura lieu le 03/10/2022 a manga",
        "22 avril 2022 , 21:15",
        true),
    infoNotif(
        "Buy Airtime",
        "bonjour souleymane , j espere que vous allez bien . vous etes invité sur une mission qui aura lieu le 03/10/2022 a manga",
        "20 mars 2020 , 11:15 ",
        true),
  ];

  List list = [
    infoNotif(
        "Buy Airtime lu ",
        "bonjour souleymane , j espere que vous allez bien . vous etes invité sur une mission qui aura lieu le 03/10/2022 a manga",
        "22 mai 2022 , 08:15 ",
        false),
    infoNotif(
        "Buy Airtime lu ",
        "bonjour souleymane , j espere que vous allez bien . vous etes invité sur une mission qui aura lieu le 03/10/2022 a manga",
        "22 avril 2022 , 21:15",
        false),
    infoNotif(
        "Buy Airtime lu",
        "bonjour souleymane , j espere que vous allez bien . vous etes invité sur une mission qui aura lieu le 03/10/2022 a manga",
        "20 mars 2020 , 11:15 ",
        false),
  ];

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
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              elevation: 0.0,
              title: CustomText(
                "Nouvelles Notifications",
                tex: 1.0,
                textAlign: TextAlign.left,
                color: bleuClaire(),
              ),
              children: <Widget>[
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
              height: 20.0,
            ),
            ExpansionTileCard(
              baseColor: blanc(),
              expandedColor: blanc(),
              initiallyExpanded: true,
              borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              elevation: 0.0,
              title: CustomText(
                "Notifications Precedentes",
                tex: 1.0,
                textAlign: TextAlign.left,
                color: bleuClaire(),
              ),
              children: <Widget>[
                Column(
                  children: [
                    cardMission(listLu[0]),
                    cardMission(listLu[1]),
                    cardMission(listLu[2]),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardMission(infoNotif infos) {
    return Column(
      children: [
        Container(
          height: 10.0,
        ),
        InkWell(
          onTap: () {
            if (infos.lu == false) {
              setState(() {
                infos.lu = true;
                listLu.add(infos);
              });
            }
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(left: 15.0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: setColors(infos), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Icon(
                        Icons.notifications_active,
                        color: setColors(infos),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomText(
                          infos.titre,
                          tex: 1.0,
                          color: noir(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomText(
                          infos.message,
                          tex: 0.8,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomText(
                          infos.date,
                          tex: 0.5,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  Color setColors(infoNotif a) {
    if (!a.lu) {
      return Colors.orange;
    }
    return gris();
  }
}
