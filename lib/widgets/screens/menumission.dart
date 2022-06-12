import 'package:cimapp/widgets/screens/missionScreens/listing.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as _getx;
import '../../models/colors.dart';
import '../../models/custom_text.dart';
import '../../models/infos.dart';
import '../../models/slidepage.dart';
import 'userScreens/user.dart';

class MenuMissionPage extends StatefulWidget {
  const MenuMissionPage({Key? key}) : super(key: key);

  @override
  State<MenuMissionPage> createState() => _MenuMissionPageState();
}

class _MenuMissionPageState extends State<MenuMissionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bleuFonce(),
          title: CustomText(
            "Missions ",
            tex: 1.2,
            fontWeight: FontWeight.normal,
          ),
          actions: [
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
            ),
            Container(
              width: 10,
            ),
          ],
        ),
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
                      //cardMission("Initier une mission", Icons.edit,
                      //const InitierMissionPage()),
                      cardOption("Mission à approuver", Icons.touch_app,
                          const ListingMission(x: 1), context),
                      cardOption("Mission à budgétiser", Icons.local_atm,
                          const ListingMission(x: 2), context),
                      cardOption("Mission à valider", Icons.check,
                          const ListingMission(x: 3), context),
                      cardOption("Mission à payer", Icons.attach_money,
                          const ListingMission(x: 4), context),
                      cardOption("Mission à vérifier", Icons.verified,
                          const ListingMission(x: 5), context),
                      cardOption("Mission à clôturer", Icons.close,
                          const ListingMission(x: 6), context),
                      cardOption(
                          "Consultation d'une mission",
                          Icons.remove_red_eye,
                          const ListingMission(x: 7),
                          context),
                    ],
                  )
                ],
              ),
              Container(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
