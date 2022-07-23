import 'package:flutter/material.dart';

import '../../../models/colors.dart';
import '../../../models/custom_text.dart';

class AproposPage extends StatefulWidget {
  const AproposPage({Key? key}) : super(key: key);

  @override
  State<AproposPage> createState() => _AproposPageState();
}

class _AproposPageState extends State<AproposPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bleuFonce(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              " CIM ",
              tex: TailleText(context).titre * 1.1,
              family: "Captain",
            ),
            Container(height: 2.0),
            CustomText(
              "circuit integré des missions",
              tex: TailleText(context).contenu * 0.85,
            ),
            Container(height: 6.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0.0,
              child: SizedBox(
                  width: TailleText(context).titre * 100,
                  height: TailleText(context).titre * 120,
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.fill,
                  )),
            ),
            Container(height: 13.0),
            CustomText(
              "Version 1.0.0",
              tex: TailleText(context).mini * 1.5,
            ),
            Container(height: 5.0),
            CustomText(
              "© 2022-2022 anptic.bf",
              tex: TailleText(context).mini * 1.5,
            ),
            Container(height: 15.0),
            TextButton(
              onPressed: () {
                debugPrint("lien");
              },
              child: CustomText(
                "LICENCES",
                tex: TailleText(context).contenu * 1.5,
                color: Colors.orangeAccent,
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget backGround() {
    return Container(
      color: bleuClaire(),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: bleuFonce(),
        ),
      ]),
    );
  }
}
