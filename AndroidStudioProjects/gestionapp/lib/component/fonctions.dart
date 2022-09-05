import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_text.dart';
import 'slidepage.dart';

Widget cardOption(
    String option, IconData icon, Widget x, BuildContext context) {
  return InkWell(
    splashColor: Colors.black87.withOpacity(0.5),
    onTap: () {
      Timer(const Duration(milliseconds: 100), () {
        Navigator.of(context).push(
          SlideRightRoute(child: x, page: x, direction: AxisDirection.left),
        );
      });
    },
    child: Column(
      children: [
        Container(
          height: 13.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Card(
                margin: const EdgeInsets.only(left: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Icon(
                      icon,
                      color: gris(),
                      size: 25.0,
                    )),
              ),
              const SizedBox(
                width: 5.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.612,
                child: Row(
                  children: [
                    Flexible(
                      child: CustomText(
                        option,
                        tex: TailleText(context).soustitre,
                        color: gris(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.chevron_right,
                      color: gris(),
                    ),
                  )),
            ],
          ),
        ]),
        Container(
          height: 13.0,
        ),
        const Divider(
          thickness: 1.0,
          height: 1.0,
          endIndent: 10,
          indent: 10,
        ),
      ],
    ),
  );
}

