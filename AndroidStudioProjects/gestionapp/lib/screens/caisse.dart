import 'package:flutter/material.dart';


class CaissePage extends StatefulWidget {
  const CaissePage({super.key});

  @override
  State<CaissePage> createState() => _CaissePageState();
}

class _CaissePageState extends State<CaissePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caisse"),
      ),
      body: const SafeArea(
        child: Text("hello"),
      ),
    );
  }
}