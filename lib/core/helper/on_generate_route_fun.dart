import 'package:flutter/material.dart';
import 'package:fruits_hub/features/login/presentation/views/sing_in_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_view.dart';

// Generates a route based on the given [RouteSettings].
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case SingInView.routeName:
      return MaterialPageRoute(builder: (_) => const SingInView());
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
