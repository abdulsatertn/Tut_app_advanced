import 'package:flutter/material.dart';
import 'package:store_app_advanced/presentation/login/view_model/login_view_model.dart';
import 'package:store_app_advanced/presentation/resources/assets_manager.dart';
import 'package:store_app_advanced/presentation/resources/color_manger.dart';
import 'package:store_app_advanced/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel(_loginUseCase);

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start(); // tell view model to start ur job

    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));

    _userPasswordController.addListener(
        () => _viewModel.setPassword(_userPasswordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: AppPadding.p100,
        ),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(ImageAssets.splashLogo),
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
