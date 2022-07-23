// ignore_for_file: unnecessary_const

import 'dart:async';
import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/colors.dart';
import '../../models/custom_text.dart';
import '../../models/dialoguetoast.dart';
import '../../models/slidepage.dart';
import '../../modelsrequest/getresponse.dart';
import '../../parser.dart';
import 'userScreens/user.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  Parser parser = Parser();

  List<GetNotifUser> feedNotifNew = [];
  List<GetNotifUser> feedNotif = [];

  int lonGueur = 0;
  late bool connect;
  late bool connectnew;
  late SharedPreferences saveDataUser;
  late SharedPreferences longNotif;
  late GetLoginReponse reponseLogin;

  int id = 0;

  loadData() async {
    longNotif = await SharedPreferences.getInstance();
    saveDataUser = await SharedPreferences.getInstance();
    //longueur= longNotif.getInt('long');

    String? repString = saveDataUser.getString('user');

    if (repString!.isNotEmpty) {
      Map<String, dynamic> map = jsonDecode(repString);
      reponseLogin = GetLoginReponse.fromJson(map);
      id = reponseLogin.codeAgent!;
      debugPrint("id agent $id");
    }
  }

  @override
  void initState() {
    connect = true;
    connectnew = true;
    callme();
    loadData();
    load();
    loadNew();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreche,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: bleuFonce(),
            title: CustomText(
              "Notifications ",
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
                Container(
                  height: 8.0,
                ),
                ExpansionTileCard(
                  baseColor: blanc(),
                  expandedColor: blanc(),
                  initiallyExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  elevation: 0.0,
                  title: CustomText(
                    "Nouvelles Notifications",
                    tex: TailleText(context).soustitre,
                    textAlign: TextAlign.left,
                    color: bleuClaire(),
                  ),
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          height: 3.0,
                        ),
                        loadFeedNotifNew()
                      ],
                    )
                  ],
                ),
                Container(
                  height: 20.0,
                ),
                ExpansionTileCard(
                  baseColor: blanc(),
                  expandedColor: blanc(),
                  initiallyExpanded: true,
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  elevation: 0.0,
                  title: CustomText(
                    "Notifications Precedentes",
                    tex: TailleText(context).soustitre,
                    textAlign: TextAlign.left,
                    color: bleuClaire(),
                  ),
                  children: <Widget>[
                    Container(
                      height: 3.0,
                    ),
                    loadFeedNotif()
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget loadFeedNotif() {
    if (feedNotif.isNotEmpty) {
      int long = feedNotif.length;
      return Column(
        children: [
          (long >= 1)
              ? cardNotif(feedNotif[long - 1])
              : cPage(" Pas de Nouvelle Notifications"),
          (long >= 2)
              ? cardNotif(feedNotif[long - 2])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 3)
              ? cardNotif(feedNotif[long - 3])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 4)
              ? cardNotif(feedNotif[long - 4])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 5)
              ? cardNotif(feedNotif[long - 5])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
        ],
      );
    } else {
      return (connect)
          ? nPage()
          : cPage(" Pas de Connection !! Reessayer SVP ...");
    }
  }

  Widget loadFeedNotifNew() {
    if (feedNotifNew.isNotEmpty) {
      int long = feedNotifNew.length;
      longNotif.setInt('long', long);
      lonGueur = long;

      return Column(
        children: [
          (long >= 1)
              ? cardNotif(feedNotifNew[long - 1])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 2)
              ? cardNotif(feedNotifNew[long - 2])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 3)
              ? cardNotif(feedNotifNew[long - 3])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 4)
              ? cardNotif(feedNotifNew[long - 4])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (long >= 5)
              ? cardNotif(feedNotifNew[long - 5])
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
        ],
      );
    } else {
      return (connectnew)
          ? nPage()
          : cPage(" Pas de Connection !! Reessayer SVP ... ");
    }
  }

  //* fonction pour changer de page
  Widget nPage() {
    return Center(
        child: Container(
      margin: const EdgeInsets.all(5),
      color: bleuClaire().withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 8.0,
          ),
          const CircularProgressIndicator(),
          Container(
            height: 8.0,
          ),
          CustomText("Recuperation des données en cours ?",
              color: gris(), tex: TailleText(context).contenu),
          Container(
            height: 8.0,
          ),
        ],
      ),
    ));
  }

  //* fonction pour changer de page
  Widget cPage(String message) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.orangeAccent.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: Icon(
                  Icons.warning,
                  color: gris(),
                  size: 50.0,
                )),
          ),
          Container(
            height: 15.0,
          ),
          CustomText(message,
              color: gris(), tex: TailleText(context).soustitre),
          Container(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget cardNotif(GetNotifUser infos) {
    // ignore: unused_local_variable

    return Column(
      children: [
        Container(
          height: 10.0,
        ),
        InkWell(
          onTap: () {
            dialogue(infos);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(left: 15.0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: setColorsNotif(infos), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                      width: 50.0,
                      height: 55.0,
                      child: Icon(
                        Icons.notifications_active,
                        color: setColorsNotif(infos),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomText(
                          infos.libelleNotif,
                          tex: TailleText(context).soustitre,
                          color: noir(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomText(
                          "Bonjour Mr/Mme ,Vous êtes invité à agir sur une mission .",
                          tex: TailleText(context).contenu,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: CustomText(
                          infos.dateNotif,
                          tex: TailleText(context).mini,
                          color: gris(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
        Container(
          height: 10.0,
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

  Future<void> dialogue(GetNotifUser a) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: blanc(),
            contentPadding: const EdgeInsets.all(2.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 50.0,
                      height: 55.0,
                      child: Icon(
                        Icons.notifications_active,
                        color: bleuClaire(),
                        size: 25.0,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomText(a.libelleNotif,
                      color: bleuClaire(),
                      tex: TailleText(context).soustitre * 1.4),
                ],
              ),
              const Divider(
                thickness: 1.0,
                height: 1.0,
                endIndent: 10,
                indent: 10,
              ),
              Container(
                height: 10.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CustomText(
                        "Bonjour Mr/Mme ,Vous êtes invité à agir sur une mission  Veuillez verifier les differentes missions en attente. \n Merci...\n",
                        tex: TailleText(context).contenu * 1.3,
                        color: gris(),
                      ),
                    ),
                  ],
                ),
              ),
              CustomText(
                a.dateNotif,
                tex: TailleText(context).mini,
                color: Colors.orangeAccent,
              ),
              Container(
                height: 10.0,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: ElevatedButton(
                      child: CustomText("retour",
                          color: blanc(),
                          tex: TailleText(context).contenu * 1.3),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 0.5),
                        primary: bleuClaire(),
                        onPrimary: bleuClaire(),
                        shadowColor: bleuFonce(),
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      onPressed: () {
                        if ((a.etatNotif!) != true) {
                          int b = (a.numNotif ?? 0);
                          debugPrint("$b");
                          notifLu(b);
                          callListingMission();
                          DInfo.toastNetral("Vous avez lu ce message");
                        }
                        Timer(const Duration(milliseconds: 500), () {
                          Navigator.pop(context);
                        });
                      }),
                ),
              ),
            ],
          );
        });
  }

  Color setColorsNotif(GetNotifUser a) {
    if (!a.etatNotif!) {
      return Colors.orange;
    }
    return gris();
  }

  notifLu(int numNotif) async {
    bool result = await Parser().putDataNotif(numNotif);

    if (result) {
      debugPrint("Notifications lue");
    } else {
      debugPrint("erreur de Connection ");
    }
  }

  callListingMission() {
    const t = const Duration(milliseconds: 500);
    Timer(t, () {
      setState(() {
        load();
        loadNew();
      });
    });
  }

  callme() {
    Timer(const Duration(seconds: 20), () {
      setState(() {
        connect = false;
        connectnew = false;
      });
    });
  }

  load() async {
    Timer(const Duration(milliseconds: 20), () async {
      List<GetNotifUser> reSulTat = await Parser().loadFeedNotifLu(id);
      setState(() {
        feedNotif = reSulTat;
      });
    });
  }

  loadNew() async {
    Timer(const Duration(milliseconds: 20), () async {
      List<GetNotifUser> reSultat = await Parser().loadFeedNotifNonLu(id);
      setState(() {
        feedNotifNew = reSultat;
      });
    });
  }

  Future refreche() async {
    await Future.delayed(const Duration(seconds: 2));
    feedNotifNew.clear();
    feedNotif.clear();
    initState();
    callme();
  }
}
