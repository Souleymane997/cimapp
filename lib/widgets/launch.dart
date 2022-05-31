import 'dart:async';

import 'package:cimapp/widgets/loginpage.dart';
import 'package:flutter/material.dart';

import '../models/colors.dart';
import '../models/custom_text.dart';
import '../models/slidepage.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  //* fonction Timer
  startTimer() async {
    Duration duration = const Duration(seconds: 5);
    return Timer(duration, navigatePage);
  }

//* fonction pour changer de page
  void navigatePage() {
    Navigator.of(context).push(
      SlideRightRoute(
          child: const LoginPage(),
          page: const LoginPage(),
          direction: AxisDirection.left),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    width: 130.0,
                    height: 160.0,
                    child: Image.asset(
                      "images/logo.png",
                      fit: BoxFit.fill,
                    )),
              ),
              Container(height: 13.0),
              CustomText(
                "CIM",
                tex: 3.0,
                family: "Captain",
              ),
              Container(height: 6.0),
              CustomText(
                "circuit integré des missions",
                tex: 0.8,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
