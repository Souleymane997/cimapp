import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText(String data,
      {color = Colors.white,
      textAlign = TextAlign.center,
      tex = 1.0,
      fontWeight = FontWeight.normal,
      family = "Roboto"})
      : super(
          data,
          textAlign: textAlign,
          textScaleFactor: tex,
          style: TextStyle(
            color: color,
            fontSize: 15.0,
            fontFamily: family,
            fontWeight: fontWeight,
          ),
          maxLines: 10,
          
        );
}

