import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key}); //default constructur

  // named constructur

  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
