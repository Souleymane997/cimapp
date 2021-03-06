import 'package:cimapp/widgets/screens/plusScreens/apropos.dart';
import 'package:cimapp/widgets/screens/plusScreens/parametrecentral.dart';
import 'package:cimapp/widgets/screens/plusScreens/parametrelocal.dart';
import 'package:cimapp/widgets/screens/userScreens/user.dart';
import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/slidepage.dart';
import '../../models/infos.dart';

class PlusPage extends StatefulWidget {
  const PlusPage({Key? key}) : super(key: key);

  @override
  State<PlusPage> createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bleuFonce(),
        title: CustomText(
          "Autres Services ",
          tex: TailleText(context).titre,
          fontWeight: FontWeight.normal,
        ),
        actions: [
          InkWell(
            onTap: () {
              debugPrint("user");
              Navigator.of(context).push(
                SlideRightRoute(
                    child: const UserPage(),
                    page: const UserPage(),
                    direction: AxisDirection.up),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.orangeAccent,
                size: 40.0,
              ),
            ),
          ),
          Container(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 10.0,
                ),
                cardOption("Paramètre Local", Icons.settings_applications,
                    const ParamLocal(), context),
                cardOption("Paramètre Central", Icons.settings,
                    const ParamCentral(), context),
                cardOption("A propos", Icons.library_books, const AproposPage(),
                    context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
