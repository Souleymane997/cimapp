import 'package:cimapp/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/dialoguetoast.dart';
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

  @override
  void initState() {
    _selectedIndex = 0;
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
                  content: const Text("Quittez CIM "),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                        setState(() {
                          exit = false;
                        });
                      },
                      child: const Text("NON"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                        SystemNavigator.pop();
                        setState(() {
                          exit = true;
                        });
                      },
                      child: const Text("OUI"),
                    ),
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
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/home.png"),
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/goal.png"),
              size: 30,
            ),
            label: "Mission",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/notifs.png"),
              size: 30,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/menuH.png"),
              size: 30,
            ),
            label: 'Plus',
          ),
        ]);
  }
}
