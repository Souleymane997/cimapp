import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/bg.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../modelsrequest/getresponse.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  SharedPreferences? loginData;
  late SharedPreferences saveDataUser;
  late GetLoginReponse reponseLogin = GetLoginReponse();
  String nomPrenom = " Souleymane";

  TextEditingController nameController = TextEditingController();
  DateTime now = DateTime.now();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    loginData = await SharedPreferences.getInstance();
    saveDataUser = await SharedPreferences.getInstance();
    String? repString = saveDataUser.getString('user');

    if (repString!.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(repString);
      reponseLogin = GetLoginReponse.fromJson(map);
      setState(() {
        nomPrenom = reponseLogin.nomPrenom!;
      });
    }
  }

  // ignore: non_constant_identifier_names

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
        child: Stack(children: [
          backGroundblanc(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  backGround(),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.17,
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
                        nomPrenom.capitalize,
                        tex: TailleText(context).titre,
                        color: noir(),
                      ),
                      Container(
                        height: 2.0,
                      ),
                      CustomText(
                        DateFormat.yMMMMEEEEd().format(now).toString(),
                        tex: TailleText(context).mini,
                        color: gris(),
                      ),
                      Container(
                        height: 5.0,
                        color: blanc(),
                        width: MediaQuery.of(context).size.width,
                      ),
                      Divider(
                        thickness: 1.0,
                        height: 2.0,
                        color: bleuFonce(),
                        endIndent: MediaQuery.of(context).size.width * 0.2,
                        indent: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ],
                  )),
              Container(
                height: 20.0,
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
                    cardProfil("Mes informations ", Icons.info_outline_rounded, context, reponseLogin),
                    cardLogout("Se deconnecter ", Icons.exit_to_app, context,
                        loginData)
                  ],
                ),
              ),
            ],
          )
        ]),
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
            height: MediaQuery.of(context).size.height * 0.2,
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
}
