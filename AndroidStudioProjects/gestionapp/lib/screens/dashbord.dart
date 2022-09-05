import 'package:flutter/material.dart';
import 'package:gestionapp/component/custom_text.dart';
import 'package:gestionapp/screens/caisse.dart';
import 'package:gestionapp/screens/client.dart';
import 'package:gestionapp/screens/fournisseurs.dart';
import 'package:gestionapp/screens/stat.dart';
import 'package:gestionapp/screens/stock.dart';
import 'package:gestionapp/screens/ventes.dart';
import '../component/constants.dart';
import '../component/slidepage.dart';
import 'navDrawer.dart';

class DashbordPage extends StatefulWidget {
  const DashbordPage({super.key});

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
      ),
      drawer: const NavDrawer(
        choix: 1,
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          bg(),
          Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        children: [
                          cardMenu("assets/images/ventes.png", "Ventes",
                              const VentesPages()),
                          cardMenu("assets/images/stock.jpg", "Stocks",
                              const StockPages()),
                        ],
                      ),
                      Row(
                        children: [
                          cardMenu("assets/images/client.jpg", "Clients",
                              const ClientPage()),
                          cardMenu("assets/images/fournis.jpg", "Fournisseurs",
                              const FournisseursPage()),
                        ],
                      ),
                      Row(
                        children: [
                          cardMenu("assets/images/caisse.jpg", "Caisse",
                              const CaissePage()),
                          cardMenu("assets/images/stat.jpg", "Statistiques",
                              const StatPage()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget bg() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 10),
              height: 40,
              color: Colors.white.withOpacity(0.7),
              child: CustomText(
                " Gestion des Stocks ",
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),
          Container(
            height: MediaQuery.of(context).size.height * 0.58,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  cardMenu(String chemin, String option, Widget x) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.47,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
          );
        },
        child: Card(
          elevation: 10.0,
          margin: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
            side: const BorderSide(
              color: Colors.white,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              children: [
                Image.asset(chemin),
                Container(
                  height: 25,
                ),
                Text(
                  option,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 25 * TailleText(context).contenu,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
