import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/layout/About_Us.dart';
import 'package:smart_service/layout/Home_Screen.dart';
import 'package:smart_service/layout/Logout_Screen.dart';
import 'package:smart_service/layout/Notification_Screen.dart';
import 'package:smart_service/models/Service_Model.dart';
import 'package:smart_service/models/User_Model.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';
import 'package:unicons/unicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../../../Shared/constant.dart';

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

  List<String> nameOrder = [
    'تفاصيل الطلب :',
    'تفاصيل الدفع :',
  ];

  List<String> detailsOrder = [
    'موعد الطلب :',
    'الخدمة :',
    'العنوان :',
    'ملاحظات :',
  ];

  List<String> detailsAnswerOrder = [
    '10-11-2020,',
    'الكهرباء',
    'رام الله-شارع القدس-عمارة 23',
    'لدي مشكلة في الكهرباء',
  ];


  int nameIndex = 0;

  int currentIndex = 0;

  void changeName(int index) {
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


  UserModel? userModel;

  Future<void> getUserData() async {
    emit(LoadingGetUserData());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data());
      emit(SuccessGetUserData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetUserData(error));
    });
  }

  List<ServiceModel> electricityList = [];

  Future<void> getElectricity() async {
    electricityList = [];
    emit(LoadingGetElectricityState());
    await FirebaseFirestore.instance.collection('houses_repair')
        .doc()
        .collection('Electricity')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            electricityList.add(ServiceModel.fromJson(element.data()));
            print(electricityList);
          });
          print('Hello');
      emit(SuccessGetElectricityState());
    }).catchError((error){
      emit(ErrorGetElectricityState(error.toString()));
    });
  }
}
