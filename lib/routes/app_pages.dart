import 'package:flutter/material.dart';

import '../view/boottom_navigation_bar/bottom_navigation_bar.dart';
import '../view/home/home_screen.dart';
import '../view/order/order_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeScreenRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeScreenRoute: (context) => const HomeMainScreen(),
    Routes.orderScreenRoute: (context) => const OrderScreen(),

    // Routes.introRoute: (context) => const IntroScreen(),

  };

}
