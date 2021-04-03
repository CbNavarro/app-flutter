import 'package:app_flutter/app/injection.dart';
import 'package:app_flutter/app/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjection();
  runApp(MyApp());
}
