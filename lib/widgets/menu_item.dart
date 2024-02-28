import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem {
  static const String view = "View";
  static const String update = "Update";

  static const List<String> choice = [view, update];

  static const Map<String, IconData> choiceIcon = {
    view: FontAwesomeIcons.eye,
    update: FontAwesomeIcons.penToSquare,
  };
}
