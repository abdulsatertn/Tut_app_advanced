import 'package:flutter/material.dart';
import 'package:store_app_advanced/presentation/forget_password/forget_password_view.dart';
import 'package:store_app_advanced/presentation/login/view/login_view.dart';
import 'package:store_app_advanced/presentation/main/main.dart';
import 'package:store_app_advanced/presentation/on_boarding/view/onboarding_view.dart';
import 'package:store_app_advanced/presentation/register/register_view.dart';
import 'package:store_app_advanced/presentation/resources/strings_manager.dart';
import 'package:store_app_advanced/presentation/splash/splash_view.dart';
import 'package:store_app_advanced/presentation/store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
  static const String onBoarding = '/onBoarding';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());

      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRoutefound),
              ),
              body: const Center(child: Text(AppStrings.noRoutefound)),
            ));
  }
}
