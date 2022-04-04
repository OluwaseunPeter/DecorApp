
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:decorapp/Screens/Home.dart';
import 'package:decorapp/Screens/LandingScreen.dart';
import 'package:decorapp/Screens/ProductDetails.dart';
import 'package:flutter/material.dart';

import 'Screens/ListingPage.dart';

class Screens {
  static const homeScreen = "/homeScreen";
  static const productDetails = "/productDetails";
  static const listDecors = "/list/:name'";
}

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(page: LandingScreen, initial: true , transitionsBuilder: TransitionsBuilders.noTransition),
    CustomRoute(page: Home , path: Screens.homeScreen , transitionsBuilder: TransitionsBuilders.noTransition),
    CustomRoute(page: ProductDetails , path: Screens.productDetails , transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: ListingPage , path: Screens.listDecors , transitionsBuilder: TransitionsBuilders.slideLeft)
  ],
)
class $AppRouter {}