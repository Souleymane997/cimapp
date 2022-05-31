import 'package:flutter/material.dart';
import '../../models/colors.dart';
import '../../models/custom_text.dart';
import '../../models/slidepage.dart';
import 'missionScreens/menumission.dart';
import 'userScreens/user.dart';

class MissionContent extends StatefulWidget {
  const MissionContent({Key? key}) : super(key: key);

  @override
  State<MissionContent> createState() => _MissionContentState();
}

class _MissionContentState extends State<MissionContent> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bleuFonce(),
          title: CustomText(
            "Services des Missions ",
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
        body: const SafeArea(
          child: MenuMissionPage(),
        ));
  }
}
