import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:smart_service/bloc/language_bloc.dart';
import 'package:smart_service/layout/Login/Register_Dealer.dart';
import 'package:smart_service/layout/Login/login.dart';
import 'package:smart_service/layout/Main_Screen.dart';
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

  runApp(BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc(LanguageState.initial()),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          locale: state.locale,
          localizationsDelegates: const[
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
      },
    );
  }
}
