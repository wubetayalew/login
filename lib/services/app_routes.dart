import 'package:flutter/material.dart';

import 'package:user_geze/screens/home_an.dart';
import 'package:user_geze/screens/index.dart';

import 'package:user_geze/screens/login.dart';

import 'package:user_geze/screens/signup.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Index.route:
        return MaterialPageRoute(builder: (_) => const Index());

      case Login.route:
        return MaterialPageRoute(builder: (_) => const Login());
      case Signup.route:
        return MaterialPageRoute(builder: (_) => const Signup());

      case HomeAn.route:
        return MaterialPageRoute(builder: (_) => const HomeAn());

      default:
        return null;
    }
  }
}
