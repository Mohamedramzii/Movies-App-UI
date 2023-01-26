import 'package:flutter/material.dart';
import 'package:movies_app/screens/homescreen.dart';
import 'package:movies_app/screens/movie_information.dart';
import 'package:movies_app/screens/onboarding_screen.dart';

class AppRoutes {
  static Route? generatingRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => const Home_Screen());
      case Routes.movieInfoScreen:
        return MaterialPageRoute(
            builder: (context) => const Movie_Information());

      default:
        unDefinedRoute();
    }
  }

  static Route? unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text('Oops! Something wrong is happened'),
              ),
            ));
  }
}

class Routes {
  static const splashScreen = '/';
  static const homeScreen = 'homeScreen';
  static const movieInfoScreen = 'movieInfoScreen';
}
