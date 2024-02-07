import 'package:flutter/material.dart';

enum DeviceScreenTypes { small, medium, large }
// small < 300
// medium > 300 & < 600
// large > 600

class Utilities {
  bool isMobileScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width < 600) {
      return true;
    } else {
      return false;
    }
  }
}
