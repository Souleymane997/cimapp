import 'package:cimapp/widgets/screens/userScreens/profil.dart';
import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/slidepage.dart';
import '../../loginpage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bleuFonce(),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                backGround(),
                Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 6,
                        ),
                        width: 80,
                        height: 80,
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.orangeAccent,
                            size: 75.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                color: blanc(),
                child: Column(
                  children: [
                    CustomText(
                      " Souleymane ZONGO ",
                      tex: 1.3,
                      color: noir(),
                    ),
                    Container(
                      height: 2.0,
                    ),
                    CustomText(
                      " lundi , 22 mai 2022 ",
                      tex: 0.6,
                      color: gris(),
                    ),
                  ],
                )),
            Container(
              height: 10.0,
              color: blanc(),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: blanc(),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 5.0,
                  ),
                  cardMission(
                      "Modifier profil ", Icons.edit, const ProfilPage()),
                  cardLogout("Se deconnecter ", Icons.exit_to_app)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backGround() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            padding: const EdgeInsets.only(bottom: 35.0),
            color: bleuFonce(),
            child: CircleAvatar(
              backgroundColor: bleuFonce(),
              child: ImageIcon(
                const AssetImage("images/logo.png"),
                size: MediaQuery.of(context).size.height * 0.5,
                color: blanc(),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            color: blanc(),
          ),
        ],
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

  Widget cardLogout(String option, IconData icon) {
    return Column(
      children: [
        Container(
          height: 13.0,
        ),
        InkWell(
          onTap: () async {
            return await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: CustomText(
                    "Se déconnecter",
                    color: noir(),
                    tex: 1.2,
                    textAlign: TextAlign.left,
                  ),
                  content: CustomText(
                    "Etes-vous sûr de vouloir vous déconnecter?",
                    color: gris(),
                    tex: 0.8,
                    textAlign: TextAlign.left,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        
                        Navigator.pop(context, false);
                      },
                      child: CustomText("NON", color: bleuClaire(), tex: 0.8),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          SlideRightRoute(
                              child: const LoginPage(),
                              page: const LoginPage(),
                              direction: AxisDirection.right),
                        );
                      },
                      child: CustomText("OUI", color: bleuClaire(), tex: 0.8),
                    ),
                  ],
                );
              },
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
