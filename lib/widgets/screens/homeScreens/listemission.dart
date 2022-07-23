import 'dart:async';

import 'package:cimapp/parser.dart';
import 'package:flutter/material.dart';
import '../../../models/colors.dart';
import '../../../models/custom_text.dart';
import '../../../models/infos.dart';
import '../../../modelsrequest/getresponse.dart';
import '../missionScreens/consultermission.dart';

// ignore: must_be_immutable
class ListeMission extends StatefulWidget {
  int x;
  int id;
  ListeMission({Key? key, required this.x, required this.id}) : super(key: key);
  @override
  State<ListeMission> createState() => _ListPageState();
}

class _ListPageState extends State<ListeMission> {
  Parser parser = Parser();
  TextEditingController editingController = TextEditingController();
  String changed = '';
  late GetMissionUser response;
  bool boarding = true;
  bool showSearch = false;

  //* pour le filtrage

  List<String>? selecteItems;
  List<String>? get selectedItems => selecteItems;

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
        title: CustomText(
          formVerif(widget.x),
          tex: TailleText(context).titre,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              debugPrint("show zone search");
              setState(() {
                showSearch = !showSearch;
              });
            },
            child:(!showSearch)? Icon(
              Icons.search,
              color: blanc(),
              size: 25.0,
            ) : Icon(
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
            (showSearch)?Row(
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
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
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
            ):const SizedBox(width:0.0,height: 0.0,),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
                // ignore: unrelated_type_equality_checks
                child: FutureBuilder<List<GetMissionUser>>(
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
                            return cardWidget(context, data[index],
                                ConsulterMission(element: data[index]));
                          });
                    })),
          ],
        ),
      ),
    );
  }

  String formVerif(int i) {
    switch (i) {
      case 0:
        {
          setState(() {
            feed = parser.loadFeed(id: widget.id);
            feedSearch = parser.loadFeed(query: changed, id: widget.id);
          });

          return "Liste des Missions";
        }

      case 7:
        {
          setState(() {
            feed = parser.loadFeedEtat(id: widget.id, etat: widget.x);
            feedSearch = parser.loadFeedEtat(
                query: changed, id: widget.id, etat: widget.x);
          });

          return "Missions Terminées";
        }

      case 1:
        {
          setState(() {
            feed = parser.loadFeedEtat(id: widget.id, etat: widget.x);
            feedSearch = parser.loadFeedEtat(
                query: changed, id: widget.id, etat: widget.x);
          });

          return "Missions Initiées ";
        }

      case 6:
        {
          setState(() {
            feed = parser.loadFeedEtat(id: widget.id, etat: widget.x);
            feedSearch = parser.loadFeedEtat(
                query: changed, id: widget.id, etat: widget.x);
          });

          return "Missions Validées ";
        }

      default:
        return '';
    }
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
}
