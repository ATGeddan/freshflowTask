import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freshflowtask/src/core/app.dart';
import 'package:freshflowtask/src/helpers/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const App());
}
