import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dummy_json_products_with_cubit/app/router/app_routes.dart';
import 'package:flutter_dummy_json_products_with_cubit/core/network/dio_factory.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/data/repos/products_repo.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/logic/products_cubit.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/ui/products_screen.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/splash/ui/splash_screen.dart';

class AppRouter {
  AppRouter._();
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                ProductsCubit(ProductsRepo(DioFactory.create())),
            child: ProductsScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('Something Went Wrong'))),
        );
    }
  }
}
