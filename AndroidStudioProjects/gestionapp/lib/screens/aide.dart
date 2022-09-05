import 'package:flutter/material.dart';

class AidePage extends StatefulWidget {
  const AidePage({super.key});

  @override
  State<AidePage> createState() => _AidePageState();
}

class _AidePageState extends State<AidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("AidePage"),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text("AidePage"),
        ),
      ),
    );
  }
}