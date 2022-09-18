import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_folderstructure/utils/routes/routes_name.dart';
import 'package:provider_folderstructure/view/home_screen.dart';
import 'package:provider_folderstructure/view/login_Screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home screen routes
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      // Login screen routes
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      // default screen routes
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(body: Center(child: Text('nothing here')));
        });
    }
  }
}
