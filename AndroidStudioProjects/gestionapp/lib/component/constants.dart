import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const backgroundColor = Color.fromRGBO(245, 245, 245, 1);
const textColor = Color(0xff222b45);
const primaryColor = Color.fromARGB(255, 21, 101, 192);
const primaryLightColor = Color(0xff26cbbb);
const shadowColor = Color(0xffe6e6e6);

Color teal() {
  return Colors.teal;
}

Color tealClaire() {
  return Colors.teal.shade300;
}

Color tealFonce() {
  return Colors.teal.shade800;
}

Color noir() {
  return HexColor("000000");
}

Color blanc() {
  return HexColor("#FFFFFF");
}

Color gris() {
  return HexColor("#6A6363");
}

Color amber() {
  return Colors.amber;
}

Color amberFone() {
  return Colors.amber.shade700;
}

Color amberClaire() {
  return Colors.amber.shade300;
}

Color grisee() {
  return const Color.fromARGB(255, 214, 210, 210);
}
