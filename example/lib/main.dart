import 'package:example/core/dependencies_container.dart';
import 'package:example/core/navigation.dart';
import 'package:example/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:payu/payu.dart';

void main() async {
  await DependenciesContainer.init();

  Payu.debug = true;
  Payu.locale = const Locale('pl');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: Navigation.pages,
    ),
  );
}
