import 'package:flutter/material.dart';

class MediaQueryManager {
  static late MediaQueryData mediaQuery;

  static void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
  }

  static double get width => mediaQuery.size.width;
  static double get height => mediaQuery.size.height;

  // For Font Sizes to be Set in Pages
  static double s14(BuildContext context) => mediaQuery.size.width * 0.035;
  static double s16(BuildContext context) => mediaQuery.size.width * 0.04;
  static double s20(BuildContext context) => mediaQuery.size.width * 0.05;
}
