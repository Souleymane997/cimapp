import 'package:flutter/material.dart';


class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stat"),
      ),
      body: const SafeArea(
        child: Text("hello"),
      ),
    );
  }
}