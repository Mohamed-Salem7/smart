import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/language/language.dart';
import 'package:smart_service/layout/on_board/splash_screen.dart';

import 'Shared/cache_helper.dart';
import 'Shared/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  if (uId != null) {
    uId = CacheHelper.getData(key: 'uId');
  }

  print(uId);
  isAr = CacheHelper.getData(key: 'isAr');
  print(isAr);
  runApp(
    ChangeNotifierProvider<ProviderLanguage>(
      create: (context) => ProviderLanguage(),
      child: const MyApp(),
    ),
  );
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
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Smart Service',
      home: ScreenShot(),
    );
  }
}
