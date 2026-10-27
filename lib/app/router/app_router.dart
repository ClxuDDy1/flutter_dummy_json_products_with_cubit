import 'package:flutter/material.dart';
import 'package:flutter_dummy_json_products_with_cubit/app/router/app_routes.dart';

class AppRouter {
  AppRouter._();
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Splash Screen'))),
        );

      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Products Screen'))),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Something Went Wrong'))),
        );
    }
  }
}
