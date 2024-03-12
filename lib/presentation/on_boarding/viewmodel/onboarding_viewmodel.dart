import 'package:store_app_advanced/presentation/base/base_view_mpdel.dart';

abstract class OnBoardingViewModel extends OnBoardingViewModelInputs
    with OnBoardingViewModelOutputs {
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
}

// inputs mean that 'Orders' that our view model will recive from view
abstract class OnBoardingViewModelInputs extends BaseViewModel {
  void goNext(); //when user click the right arrow or  swipe left
  void goPrevious(); // when use clicks on left arrow or swap right

  void onPageChanged(int index);
}

mixin class OnBoardingViewModelOutputs {}
