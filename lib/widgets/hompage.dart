import 'package:cimapp/models/colors.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/mission.dart';
import 'screens/notifs.dart';
import 'screens/plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late Widget _child;

  @override
  void initState() {
    _child = const HomeContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _child,
        bottomNavigationBar : barNavigationBottom(),
    ));
  }

  Widget barNavigationBottom() {
    return BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: blanc(),
            selectedItemColor: bleuClaire(),
            unselectedItemColor: gris(),
            selectedFontSize: 13,
            unselectedFontSize: 10,
            showUnselectedLabels: false,
            onTap: (value) {
              setState(() {
                _handleNavigationChange(value);
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





  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const HomeContent();
          break;
        case 1:
          _child = const MissionContent();
          break;
        case 2:
          _child = const SettingsContent();
          break;
        case 3:
          _child = const UserContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
        child: _child,
      );
    });
  }



}
