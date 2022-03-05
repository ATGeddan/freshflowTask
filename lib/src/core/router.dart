import 'package:flutter/material.dart';
import 'package:freshflowtask/src/core/route_names.dart';
import 'package:freshflowtask/src/models/cart_item.dart';
import 'package:freshflowtask/src/screens/cart_screen/cart_screen.dart';
import 'package:freshflowtask/src/screens/item_details/item_details_screen.dart';
import 'package:freshflowtask/src/screens/login_screen/login_screen.dart';
import 'package:freshflowtask/src/screens/splash_screen/splash_screen.dart';

mixin Router {
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute<SplashScreen>(
          settings: settings,
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteNames.login:
        return MaterialPageRoute<LoginScreen>(
          settings: settings,
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RouteNames.cart:
        return MaterialPageRoute<CartScreen>(
          settings: settings,
          builder: (BuildContext context) => const CartScreen(),
        );
      case RouteNames.cartItem:
        return MaterialPageRoute<ItemDetailsScreen>(
          settings: settings,
          builder: (BuildContext context) =>
              ItemDetailsScreen(item: settings.arguments! as CartItem),
        );
      default:
        return MaterialPageRoute<LoginScreen>(
          settings: settings,
          builder: (BuildContext context) => const LoginScreen(),
        );
    }
  }
}
