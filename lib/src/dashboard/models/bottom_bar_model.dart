import 'package:flutter/cupertino.dart';

import '../../../common/enums/app_enum.dart';

class BottomBarModel {
  final Widget selectedIconData;
  final Widget iconData;
  final String title;
  final BottomBarMenu menu;

  BottomBarModel({
    required this.title,
    required this.selectedIconData,
    required this.menu,
    required this.iconData,
  });
}
