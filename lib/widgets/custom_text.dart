import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText(String data, {color: Colors.white, textAlign: TextAlign.center, factor: 1.0}):
    super(data,
      textAlign: textAlign,
      textScaleFactor: factor,
      style: TextStyle(color: color)
    );
    
}