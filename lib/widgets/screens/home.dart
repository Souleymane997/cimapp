import 'package:cimapp/models/custom_text.dart';
import 'package:cimapp/widgets/screens/homeScreens/dashbord.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(body: const SafeArea(child: DashbordPage()));
  }
}
