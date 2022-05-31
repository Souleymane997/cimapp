import 'package:cimapp/widgets/screens/plusScreens/pluspage.dart';
import 'package:flutter/material.dart';
import '../../models/colors.dart';
import '../../models/custom_text.dart';
import '../../models/slidepage.dart';
import 'userScreens/user.dart';

class UserContent extends StatefulWidget {
  const UserContent({Key? key}) : super(key: key);

  @override
  State<UserContent> createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {

   return Scaffold(
       appBar: AppBar(
          backgroundColor: bleuFonce(),
          title: CustomText(
            "Autres Services ",
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
          child: PlusPage(),
        ));
  }
}
