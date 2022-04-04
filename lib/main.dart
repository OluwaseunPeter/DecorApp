import 'package:decorapp/Screens/Home.dart';
import 'package:decorapp/Screens/ProductDetails.dart';
import 'package:flutter/material.dart';

import 'AppRouter.gr.dart';
import 'Screens/LandingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Roboto",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primaryColor: CustomColors.pryBlue,
        primaryColor: const Color(0xFFEFE1D9),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

