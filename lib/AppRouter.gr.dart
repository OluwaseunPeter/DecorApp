// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'Screens/Home.dart' as _i2;
import 'Screens/LandingScreen.dart' as _i1;
import 'Screens/ListingPage.dart' as _i4;
import 'Screens/ProductDetails.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LandingScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.LandingScreen(),
          transitionsBuilder: _i5.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.Home(),
          transitionsBuilder: _i5.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ProductDetailsRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.ProductDetails(),
          transitionsBuilder: _i5.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    ListingPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ListingPageRouteArgs>(
          orElse: () =>
              ListingPageRouteArgs(pageName: pathParams.getString('name')));
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.ListingPage(key: args.key, pageName: args.pageName),
          transitionsBuilder: _i5.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LandingScreenRoute.name, path: '/'),
        _i5.RouteConfig(HomeRoute.name, path: '/homeScreen'),
        _i5.RouteConfig(ProductDetailsRoute.name, path: '/productDetails'),
        _i5.RouteConfig(ListingPageRoute.name, path: '/list/:name\'')
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingScreenRoute extends _i5.PageRouteInfo<void> {
  const LandingScreenRoute() : super(LandingScreenRoute.name, path: '/');

  static const String name = 'LandingScreenRoute';
}

/// generated route for
/// [_i2.Home]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/homeScreen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ProductDetails]
class ProductDetailsRoute extends _i5.PageRouteInfo<void> {
  const ProductDetailsRoute()
      : super(ProductDetailsRoute.name, path: '/productDetails');

  static const String name = 'ProductDetailsRoute';
}

/// generated route for
/// [_i4.ListingPage]
class ListingPageRoute extends _i5.PageRouteInfo<ListingPageRouteArgs> {
  ListingPageRoute({_i6.Key? key, required String pageName})
      : super(ListingPageRoute.name,
            path: '/list/:name\'',
            args: ListingPageRouteArgs(key: key, pageName: pageName),
            rawPathParams: {'name': pageName});

  static const String name = 'ListingPageRoute';
}

class ListingPageRouteArgs {
  const ListingPageRouteArgs({this.key, required this.pageName});

  final _i6.Key? key;

  final String pageName;

  @override
  String toString() {
    return 'ListingPageRouteArgs{key: $key, pageName: $pageName}';
  }
}
