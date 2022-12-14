import 'package:flutter/material.dart';
import 'package:flutter_clean_code/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_clean_code/presentation/login/login.dart';
import 'package:flutter_clean_code/presentation/main/main_view.dart';
import 'package:flutter_clean_code/presentation/onboarding/onboarding.dart';
import 'package:flutter_clean_code/presentation/register/register.dart';
import 'package:flutter_clean_code/presentation/splash/splash.dart';
import 'package:flutter_clean_code/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String onBoardRoute = "/onboard";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgot";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.onBoardRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No route found'),
              ),
              body: const Center(
                child: Text('Hmm, seems like nothing matches here'),
              ),
            ));
  }
}
