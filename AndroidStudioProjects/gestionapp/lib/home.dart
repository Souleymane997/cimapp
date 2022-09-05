// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionapp/screens/aide.dart';
import 'package:gestionapp/screens/client.dart';
import 'package:gestionapp/screens/fournisseurs.dart';
import 'package:gestionapp/screens/parametres/parametre.dart';

import 'component/custom_text.dart';
import 'screens/dashbord.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool exit = true;

  var screens = [
    const DashbordPage(),
    const ClientPage(),
    const ParametrePage(),
  ];

  int id = 0;

  @override
  void initState() {
    _selectedIndex = 0;

    screens = [
      const DashbordPage(),
      const ClientPage(),
      const ParametrePage(),
    ];

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
                  content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: CustomText(
                                  " Quitter l'application ? ",
                                  tex: TailleText(context).soustitre,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          shadowColor: Colors.teal,
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
                        },
                        child: CustomText(
                          "NON",
                          color: Colors.teal,
                          tex: TailleText(context).contenu,
                        )),
                    const SizedBox(width: 7.5),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          shadowColor: Colors.teal,
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
                        },
                        child: CustomText(
                          "OUI",
                          color: Colors.white,
                          tex: TailleText(context).contenu,
                        )),
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
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/home.png"),
              size: 25,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/client.png"),
              size: 25,
            ),
            label: "Clients",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/settings.png"),
              size: 25,
            ),
            label: 'Parametres',
          ),
        ]);
  }
}
