import 'package:flutter/material.dart';
import 'package:store_app_advanced/presentation/resources/color_manger.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey2,
      body: const Center(child: Text('welcome to omBoaeding')),
    );
  }
}
