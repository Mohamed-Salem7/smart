import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/layout/About_Us.dart';
import 'package:smart_service/layout/Home_Screen.dart';
import 'package:smart_service/layout/Logout_Screen.dart';
import 'package:smart_service/layout/Notification_Screen.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';
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

  List<String> name = [
    'الكل',
    'كهرباء',
    'مواسير',
    'مكيفات',
    'صيانة',
    'دهان',
    'تنظيف منازل'
  ];

  int nameIndex = 0;

  int currentIndex = 0;

  void changeName(int index)
  {
    nameIndex = index;
    emit(ChangeScreenDetailsState());
  }

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreenBottom());
  }

  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(
        icon: Icon(UniconsLine.home_alt), label: 'الرئيسية'),
    const BottomNavigationBarItem(
        icon: Icon(Iconsax.notification), label: 'الإشعارات'),
    const BottomNavigationBarItem(
        icon: Icon(Iconsax.info_circle), label: 'عنا'),
    const BottomNavigationBarItem(icon: Icon(Iconsax.logout), label: 'خروج'),
  ];
}
