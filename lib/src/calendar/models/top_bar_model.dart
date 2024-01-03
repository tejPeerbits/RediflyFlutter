import 'package:flutter/cupertino.dart';

import '../../../common/enums/app_enum.dart';

class TopBarModel {
  final Widget selectedIconData;
  final Widget iconData;
  final String title;
  final TopBarMenu menu;

  TopBarModel({
    required this.title,
    required this.selectedIconData,
    required this.menu,
    required this.iconData,
  });
}
