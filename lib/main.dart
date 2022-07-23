import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:smart_service/layout/Login/Register_Dealer.dart';
import 'package:smart_service/layout/Login/login.dart';
import 'package:smart_service/layout/Main_Screen.dart';
import 'package:smart_service/layout/on_board/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Smart Service',
      home:  ScreenShot(),
    );

  }
}


