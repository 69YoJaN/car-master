// ignore_for_file: constant_identifier_names, equal_keys_in_map

import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String application = '/application';
  static const String vitalsDashboard = '/vitalsDashboard';

  static const String registration_status = '/ registration_status';
  static final routes = <String, WidgetBuilder>{
    // application: (BuildContext context) => Application(),
    // vitalsDashboard: (BuildContext context) => VitalsDashboard(),
  };
}
