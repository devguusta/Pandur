import 'dart:math';

import 'package:flutter/cupertino.dart';

class AppColors {

  static const Color kMain = Color(0xFF1F60F3);
  static const Color kDarkBlue = Color(0xFF10182C);
  static const Color kLightBlue = Color(0xFF162037);
  static const Color kTexts = Color(0xFF666786);
  static const Color kGradientOne = Color(0xFF5380E3);
  static const Color kGradientTwo = Color(0xFF004BF4);
  static const LinearGradient kGradient = LinearGradient(
    colors: <Color>[kGradientOne,kGradientTwo],
    begin: Alignment.topLeft,
    end:Alignment.bottomRight,
    stops:[0.1,0.7],
    transform: GradientRotation((-34 * pi)/180),
    );

}