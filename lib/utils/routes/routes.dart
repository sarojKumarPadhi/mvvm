import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const HomePage();
        });

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen();
        });

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes Found"),
            ),
          );
        });
    }
  }
}
