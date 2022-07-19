import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/Home/About_Us.dart';
import 'package:smart_service/Home/Home_Screen.dart';
import 'package:smart_service/Home/Logout_Screen.dart';
import 'package:smart_service/Home/Notification_Screen.dart';
import 'package:smart_service/Home/cubit/state.dart';
import 'package:unicons/unicons.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    const HomeScreen(),
    const NotificationScreen(),
    const AboutUs(),
    const LogoutScreen(),
  ];

  int currentIndex = 0;

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenBottom());
  }


  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(
      icon: Icon(UniconsLine.home_alt),
      label: 'الرئيسية'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.notification),
      label: 'الإشعارات'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.info_circle),
      label: 'عنا'
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.logout),
      label: 'خروج'
    ),
  ];
}
