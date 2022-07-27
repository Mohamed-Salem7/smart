import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/Shared/cache_helper.dart';
import 'package:smart_service/language/language.dart';
import 'package:smart_service/layout/Login/Register.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/layout/Login/login.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';
import 'package:unicons/unicons.dart';

import '../modules/Home/cubit/cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state)
        {
        },
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          var lang = Provider.of<ProviderLanguage>(context,listen: true);
          return Directionality(
            textDirection: lang.isAr ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              body: homeCubit.screen[homeCubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: homeCubit.currentIndex,
                onTap: (value)
                {
                  homeCubit.changeScreen(value);
                },
                items: [
                   BottomNavigationBarItem(
                    icon: Icon(UniconsLine.home_alt),
                    label: lang.getText('Home') as String,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.notification),
                    label: lang.getText('Notification') as String,
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Iconsax.info_circle),
                    label: lang.getText('About_Us') as String,
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Iconsax.setting),
                    label: lang.getText('Settings') as String,
                  ),
                ],
                selectedItemColor: const Color(0xff5300BF),
                unselectedItemColor: const Color(0xff979797),
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  color:  Color(0xff5300BF),
                  letterSpacing: 0.256,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  letterSpacing: 0.256,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
