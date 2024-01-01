import 'package:flutter/cupertino.dart';

class Responsive {

  Responsive._();

  static bool isiPad(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width > 600;
  }
}