import 'package:flutter/material.dart';
import 'package:flutter_dummy_json_products_with_cubit/app/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(onGenerateRoute: AppRouter.onGenerate);
  }
}
