import 'dart:async';

import 'package:store_app_advanced/presentation/common/state_renderer/state_renderer_implementer.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
// shared variables and function that will be through any view model

  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outPutState =>
      _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // start view model job

  void dispose(); // will be called when view model dies

  Sink get inputState;
}

abstract mixin class BaseViewModelOutputs {
  Stream<FlowState> get outPutState;
}
