import 'dart:async';

import 'package:cimapp/widgets/hompage.dart';
import 'package:cimapp/widgets/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/colors.dart';
import '../models/custom_text.dart';
import '../models/slidepage.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  late SharedPreferences loginData;
  late bool newUser;

  //* fonction Timer
  startTimer() async {
    Duration duration = const Duration(seconds: 5);
    return Timer(duration, navigatePage );
  }

//* fonction pour changer de page
  void navigatePage() {
    if (newUser) {
      Navigator.of(context).push(
        SlideRightRoute(
            child: const LoginPage(),
            page: const LoginPage(),
            direction: AxisDirection.left),
      );
    } else {
      Navigator.of(context).push(
        SlideRightRoute(
            child: const HomePage(),
            page: const HomePage(),
            direction: AxisDirection.left),
      );
    }
  }

  @override
  void initState() {
    checkLogin();
    startTimer();
    super.initState();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: bleuClaire().withOpacity(0.7),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 20.0,
                  child: SizedBox(
                      width: TailleText(context).titre * 104 ,
                      height: TailleText(context).titre * 128,
                      child: Image.asset(
                        "images/logo.png",
                        fit: BoxFit.fill,
                      )),
                ),
                Container(height: 13.0),
                CustomText(
                  "CIM",
                  tex: TailleText(context).titre * 2.4,
                  family: "Captain",
                ),
                Container(height: 6.0),
                CustomText(
                  "circuit integré des missions",
                  tex: TailleText(context).contenu,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
