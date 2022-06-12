import 'package:flutter/material.dart';
import '../models/colors.dart';
//import 'package:get/get.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blanc(),
          border: Border.all(
            color: bleuClaire(),
            width: 1,
          ),
        ),
        child: child);
  }
}


