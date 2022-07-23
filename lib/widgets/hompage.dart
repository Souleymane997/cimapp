import 'dart:async';
import 'dart:convert';

import 'package:cimapp/models/colors.dart';
import 'package:cimapp/models/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';
import '../modelsrequest/getresponse.dart';
import '../parser.dart';
import 'screens/dashbord.dart';
import 'screens/menumission.dart';
import 'screens/notifs.dart';
import 'screens/plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool exit = true;

  final screens = [
    const DashbordPage(),
    const MenuMissionPage(),
    const SettingsContent(),
    const PlusPage(),
  ];
  late SharedPreferences longNotif;
  List<GetNotifUser> feedNotifNew = [];
  int lonGueur = 0;
  int lonG = 0;
  int id = 0;

  late SharedPreferences saveDataUser;
  late GetLoginReponse reponseLogin;

  loadData() async {
    saveDataUser = await SharedPreferences.getInstance();
    longNotif = await SharedPreferences.getInstance();
    String? repString = saveDataUser.getString('user');

    if (repString!.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(repString);
      reponseLogin = GetLoginReponse.fromJson(map);
      id = reponseLogin.codeAgent!;
    }
  }

  @override
  void initState() {
    _selectedIndex = 0;
    loadData();
    loadNew();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  title: CustomText(Config.appName,
                      tex: TailleText(context).titre,
                      color: bleuClaire(),
                      textAlign: TextAlign.left),
                  content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(
                          thickness: 1.0,
                          height: 2.0,
                          color: grisee(),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: CustomText(
                                  "Voulez vous quitter l'application ? ",
                                  tex: TailleText(context).soustitre,
                                  color: noir(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  actions: [
                    ElevatedButton(
                        child: CustomText(
                          "NON",
                          color: bleuClaire(),
                          tex: TailleText(context).contenu,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          shadowColor: bleuFonce(),
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, false);
                          setState(() {
                            exit = false;
                          });
                        }),
                    const SizedBox(width: 7.5),
                    ElevatedButton(
                        child: CustomText(
                          "OUI",
                          color: blanc(),
                          tex: TailleText(context).contenu,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          primary: bleuClaire(),
                          onPrimary: bleuClaire(),
                          shadowColor: bleuFonce(),
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, true);
                          SystemNavigator.pop();
                          setState(() {
                            exit = true;
                          });
                        }),
                    const SizedBox(width: 2.5),
                  ],
                );
              });
          return exit;
        } else {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(index: _selectedIndex, children: screens),
          bottomNavigationBar: barNavigationBottom(),
        ),
      ),
    );
  }

  Widget barNavigationBottom() {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        backgroundColor: blanc(),
        selectedItemColor: bleuClaire(),
        unselectedItemColor: gris(),
        selectedFontSize: 13,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/home.png"),
              size: 30,
            ),
            label: "Accueil",
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/goal.png"),
              size: 30,
            ),
            label: "Mission",
          ),
          BottomNavigationBarItem(
            icon: Stack(children: [
              const ImageIcon(
                AssetImage("images/notifs.png"),
                size: 30,
              ),
              (lonGueur != 0)
                  ? Positioned(
                      // draw a red marble
                      top: 0.0,
                      right: 4.0,
                      child: Icon(Icons.brightness_1,
                          size: 10.0, color: bleuClaire()),
                    )
                  : Positioned(
                      // draw a red marble
                      top: 0.0,
                      right: 4.0,
                      child: Icon(Icons.brightness_1,
                          size: 0.0, color: bleuClaire()),
                    ),
            ]),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/menuH.png"),
              size: 30,
            ),
            label: 'Plus',
          ),
        ]);
  }

  callListingMission() {
    const t = Duration(seconds: 1);
    Timer.periodic(t, (Timer timer) {
      callNotif();
    });
  }

  callNotif() async {
    lonG = (longNotif.getInt('long') ?? 0);
    if (lonG != lonGueur) {
      setState(() {
        lonGueur = lonG;
        debugPrint("lonG $lonG");
      });
    }
  }

  loadNew() async {
    Timer(const Duration(seconds: 5), () async {
      List<GetNotifUser> reSultat = await Parser().loadFeedNotifNonLu(id);
      setState(() {
        feedNotifNew = reSultat;
        lonGueur = feedNotifNew.length;
        longNotif.setInt('long', lonGueur);
        lonG = lonGueur;
        debugPrint("load New $lonG");
      });
      callListingMission();
    });
  }
}
