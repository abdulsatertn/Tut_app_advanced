import 'package:flutter/material.dart';
import 'package:store_app_advanced/app/app.dart';
import 'package:store_app_advanced/app/di.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // to make sure that the app wont run before all aways funs are ready
  await initAppModule();
  runApp(const MyApp());
}
