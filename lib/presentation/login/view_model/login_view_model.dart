import 'dart:async';

import 'package:store_app_advanced/domain/use_case/login_use_case.dart';
import 'package:store_app_advanced/presentation/base/base_view_model.dart';
import 'package:store_app_advanced/presentation/common/freezed_data_class.dart';
import 'package:store_app_advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:store_app_advanced/presentation/common/state_renderer/state_renderer_implementer.dart';

class LoginViewModel extends LoginViewModelInputs with LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject('', '');

  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    super.dispose();

    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // view model should tell you please show content state

    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    inputState.add(LoadingState(
      stateRendererType: StateRendererType.popupLoadingState,
    ));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => {
                  // left => failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                },
            (data) => {
                  // right => data
                  // content
                  inputState.add(ContentState()),
                  // navigate to main screen
                });
  }

  // Outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
}

abstract class LoginViewModelInputs extends BaseViewModel {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

abstract mixin class LoginViewModelOutputs {
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}
