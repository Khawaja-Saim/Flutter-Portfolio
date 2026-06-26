import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext ctx)  => MediaQuery.of(ctx).size.width < 768;
  static bool isTablet(BuildContext ctx)  => MediaQuery.of(ctx).size.width >= 768 && MediaQuery.of(ctx).size.width < 1100;
  static bool isDesktop(BuildContext ctx) => MediaQuery.of(ctx).size.width >= 1100;

  static double padH(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    if (w < 768)  return 20;
    if (w < 1100) return 48;
    return 80;
  }

  static int skillCols(BuildContext ctx)   => isMobile(ctx) ? 2 : isTablet(ctx) ? 3 : 4;
  static int projectCols(BuildContext ctx) => isMobile(ctx) ? 1 : isTablet(ctx) ? 2 : 3;
  static int serviceCols(BuildContext ctx) => isMobile(ctx) ? 1 : isTablet(ctx) ? 2 : 4;

  static double heroFont(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    if (w < 480)  return 30;
    if (w < 768)  return 36;
    if (w < 1100) return 44;
    return 54;
  }
}
