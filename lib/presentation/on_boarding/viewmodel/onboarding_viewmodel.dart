import 'dart:async';

import 'package:store_app_advanced/domain/models.dart';
import 'package:store_app_advanced/presentation/base/base_view_model.dart';

abstract class OnBoardingViewModel extends OnBoardingViewModelInputs
    with OnBoardingViewModelOutputs {
  StreamController _streamController = StreamController<SliderViewObject>();

  //onBoarding viewModel Inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  // onboarding view model inputs
  @override
  Sink get inputSliderViewObject => throw UnimplementedError();

// onboarding view model outputs
  @override
  Stream get outputSliderViewObject => throw UnimplementedError();
}

// inputs mean that 'Orders' that our view model will recive from view
abstract class OnBoardingViewModelInputs extends BaseViewModel {
  void goNext(); //when user click the right arrow or  swipe left
  void goPrevious(); // when use clicks on left arrow or swap right

  void onPageChanged(int index);

  // stream controller input
  Sink get inputSliderViewObject;
}

abstract mixin class OnBoardingViewModelOutputs {
  // stream controller output
  Stream get outputSliderViewObject;
}
