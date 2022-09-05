import 'package:flutter/material.dart';
import 'package:gestionapp/screens/parametres/categorie.dart';
import 'package:gestionapp/screens/parametres/type.dart';
import '../../component/custom_text.dart';
import '../../component/fonctions.dart';

class ParametrePage extends StatefulWidget {
  const ParametrePage({super.key});

  @override
  State<ParametrePage> createState() => _ParametrePageState();
}

class _ParametrePageState extends State<ParametrePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            "Gestion des Parametres",
            tex: TailleText(context).titre,
            fontWeight: FontWeight.normal,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 15.0,
              ),
              cardOption(
                  "Categorie", Icons.apps, const CategoriePage(), context),
              Container(
                height: 15.0,
              ),
              cardOption(
                  "Type", Icons.keyboard_capslock, const TypePage(), context),
              Container(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
