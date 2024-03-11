import 'package:flutter/material.dart';
import 'package:store_app_advanced/presentation/resources/color_manger.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  List<SliderObject> _getSliderData() => [SliderObject(title, subTitle, image)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey2,
      body: const Center(child: Text('welcome to omBoaeding')),
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
