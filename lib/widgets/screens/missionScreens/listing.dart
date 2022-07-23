import 'dart:async';

import 'package:cimapp/parser.dart';
import 'package:cimapp/widgets/screens/missionScreens/approuvemission.dart';
import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../modelsrequest/getresponse.dart';
import 'bugetisermission.dart';
import 'cloturermission.dart';
import 'consultermission.dart';
import 'payermission.dart';
import 'validermission.dart';
import 'verifiermission.dart';

class ListingMission extends StatefulWidget {
  final int x;
  const ListingMission({Key? key, required this.x}) : super(key: key);
  @override
  State<ListingMission> createState() => _ListPageState();
}

class _ListPageState extends State<ListingMission> {
  Parser parser = Parser();
  TextEditingController editingController = TextEditingController();
  String changed = '';
  late GetMissionUser response;
  bool boarding = true;
  bool showSearch = false;

  // ignore: prefer_typing_uninitialized_variables
  int choiceWidget = 0;

  Future<List<GetMissionUser>> feed = Parser().loadFeed();
  Future<List<GetMissionUser>> feedSearch = Parser().loadFeed();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(formVerif(widget.x), tex: 1.2),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              debugPrint("show zone search");
              setState(() {
                showSearch = !showSearch;
              });
            },
            child: (!showSearch)
                ? Icon(
                    Icons.search,
                    color: blanc(),
                    size: 25.0,
                  )
                : Icon(
                    Icons.cancel,
                    color: blanc(),
                    size: 25.0,
                  ),
          ),
          Container(
            width: 15,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            (showSearch)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: TextField(
                          controller: editingController,
                          onChanged: (value) {
                            changed = value;
                            if (changed.isNotEmpty) {
                              setState(() {
                                parser.loadFeed(query: changed);
                                boarding = false;
                              });
                            } else {
                              setState(() {
                                boarding = true;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0.0),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: changed.isNotEmpty
                                ? GestureDetector(
                                    child: const Icon(Icons.close),
                                    onTap: () {
                                      editingController.clear();
                                      changed = '';
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                                  )
                                : null,
                            hintText: " rechercher une mission........ ",
                            // border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    width: 0.0,
                    height: 0.0,
                  ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(child: elemntInList()),
          ],
        ),
      ),
    );
  }

  String formVerif(int i) {
    switch (i) {
      case 2:
        {
          callListingMission();
          return " Missions à Approuver ";
        }

      case 3:
        {
          callListingMission();
          return "Missions à Budgetiser";
        }

      case 4:
        {
          callListingMission();
          return " Missions à Payer";
        }

      case 5:
        {
          callListingMission();
          return "Missions à Verifier ";
        }

      case 6:
        {
          callListingMission();
          return "Missions à Valider ";
        }

      case 7:
        {
          callListingMission();
          return "Missions à Cloturer ";
        }

      case 8:
        {
          Timer(const Duration(seconds: 1), () {
            setState(() {
              feed = parser.loadFeedMissionConsulter();
              feedSearch = parser.loadFeedMissionConsulter(query: changed);
            });
          });
          return "Consultation d'une Mission ";
        }

      default:
        return '';
    }
  }

  Widget elemntInList() {
    return FutureBuilder<List<GetMissionUser>>(
        future: (boarding) ? feed : feedSearch,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return nPage();
          }
          List<GetMissionUser>? data = snapshot.data;

          if (data!.isEmpty) {
            return cPage("Oups !! Votre Liste est Vide ");
          }

          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (widget.x == 2) {
                  return cardWidget(context, data[index],
                      ApprouveMission(element: data[index]));
                }
                if (widget.x == 3) {
                  return cardWidget(context, data[index],
                      BudgetMission(element: data[index]));
                }

                if (widget.x == 4) {
                  return cardWidget(
                      context, data[index], PayerMission(element: data[index]));
                }
                if (widget.x == 5) {
                  return cardWidget(context, data[index],
                      VerifierMission(element: data[index]));
                }

                if (widget.x == 6) {
                  return cardWidget(context, data[index],
                      ValiderMission(element: data[index]));
                }

                if (widget.x == 7) {
                  return cardWidget(context, data[index],
                      CloturerMission(element: data[index]));
                }

                return cardWidget(context, data[index],
                    ConsulterMission(element: data[index]));
              });
        });
  }

  Widget cPage(String message) {
    return Center(
      child: Container(
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
      ),
    );
  }

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

  callListingMission() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        feed = parser.loadFeedMissionEtat(etat: widget.x - 1);
        feedSearch =
            parser.loadFeedMissionEtat(query: changed, etat: widget.x - 1);
      });
    });
  }
}
