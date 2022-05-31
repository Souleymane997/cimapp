import 'package:cimapp/widgets/screens/notifsScreens/notifpage.dart';
import 'package:flutter/material.dart';
import '../../models/colors.dart';
import '../../models/custom_text.dart';
import '../../models/slidepage.dart';
import 'userScreens/user.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: bleuFonce(),
          title: CustomText(
            "Notifications ",
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
          child: NotifPage(),
        ));
  }
}
