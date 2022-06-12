import 'package:cimapp/parser.dart';
import 'package:cimapp/widgets/screens/homeScreens/detailsmission.dart';
import 'package:cimapp/widgets/screens/missionScreens/approuvemission.dart';
import 'package:flutter/material.dart';

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
  late getReponse response;
  bool boarding = true;

  // ignore: prefer_typing_uninitialized_variables
  List<getReponse> feed = [];
  int choiceWidget = 0;

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
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Container(
              margin: const EdgeInsets.only(right: 15.0, left: 15.0),
              padding: const EdgeInsets.all(5.0),
              child: TextField(
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
                controller: editingController,
                decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70.0)))),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
                child: FutureBuilder<List<getReponse>>(
                    future: (boarding)
                        ? parser.loadFeed()
                        : parser.loadFeed(query: changed),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      List<getReponse>? data = snapshot.data;
                      return ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (context, index) {
                            if (widget.x == 1) {
                              return cardWidget(context, data![index],
                                  ApprouveMission(element: data[index]));
                            }
                            if (widget.x == 2) {
                              return cardWidget(context, data![index],
                                  BudgetMission(element: data[index]));
                            }
                            if (widget.x == 3) {
                              return cardWidget(context, data![index],
                                  ValiderMission(element: data[index]));
                            }
                            if (widget.x == 4) {
                              return cardWidget(context, data![index],
                                  PayerMission(element: data[index]));
                            }
                            if (widget.x == 5) {
                              return cardWidget(context, data![index],
                                  VerifierMission(element: data[index]));
                            }
                            if (widget.x == 6) {
                              return cardWidget(context, data![index],
                                  CloturerMission(element: data[index]));
                            }

                            return cardWidget(context, data![index],
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
      case 1:
        return "Missions à Approuver";

      case 2:
        return "Missions à Budgetiser";

      case 3:
        return "Missions à Valider ";

      case 4:
        return " Missions à Payer";

      case 5:
        return "Missions à Verifier ";

      case 6:
        return "Missions à Cloturer ";
      case 7:
        return "Consultation d'une Mission ";
      default:
        return '';
    }
  }
}
