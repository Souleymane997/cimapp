
import 'package:cimapp/widgets/screens/plusScreens/apropos.dart';
import 'package:cimapp/widgets/screens/plusScreens/parametrecentral.dart';
import 'package:cimapp/widgets/screens/plusScreens/parametrelocal.dart';
import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/slidepage.dart';

class PlusPage extends StatefulWidget {
  const PlusPage({ Key? key }) : super(key: key);

  @override
  State<PlusPage> createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Container(height: 10.0,),
                cardMission("Paramètre Local", Icons.settings_applications,
                    const ParamLocal()),
                cardMission("Paramètre Central", Icons.settings,
                    const ParamCentral()),
                cardMission("A propos", Icons.library_books,
                    const AproposPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }



  Widget cardMission(String option, IconData icon, Widget x) {
    return Column(
      children: [
        Container(
          height: 13.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
            );
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(left: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: Icon(
                        icon,
                        color: gris(),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomText(
                          option,
                          tex: 1.0,
                          color: gris(),
                        ),
                      ),
                      SizedBox(
                          width: 25.0,
                          height: 25.0,
                          child: Icon(
                            Icons.chevron_right,
                            color: gris(),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
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