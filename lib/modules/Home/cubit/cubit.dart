import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/layout/About_Us.dart';
import 'package:smart_service/layout/Home_Screen.dart';
import 'package:smart_service/layout/Setting/Settings_Screen.dart';
import 'package:smart_service/layout/Notification_Screen.dart';
import 'package:smart_service/models/Deleviry_Service.dart';
import 'package:smart_service/models/Register_Model.dart';
import 'package:smart_service/models/Service_Model.dart';
import 'package:smart_service/models/Services_Model.dart';
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
    const SettingsScreen(),
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

  List<String> name2 = [
    'الكل',
    'مطاعم',
    'كافيهات',
    'سوبر ماركت',
    'شركات توصيل',
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

  String language = 'العربية';
   List<String> items = [
    'العربية',
    'English',
  ];

   void changeValueLanguage(String value)
   {
     language = value;
     emit(ChangeValueLanguage());
   }

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
    const BottomNavigationBarItem(
        icon: Icon(Iconsax.setting), label: 'إعدادات'),
  ];

  RegisterModel? userModel;

  Future<void> getUserData() async {
    emit(LoadingGetUserData());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      userModel = RegisterModel.fromJson(value.data());
      emit(SuccessGetUserData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetUserData(error.toString()));
    });
  }

  List<ServicesModel> servicesList = [];

  Future<void> getServices() async {
    emit(LoadingGetServicesState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        servicesList.add(ServicesModel.fromJson(element.data()));
      });
      emit(SuccessGetServicesState());
    }).catchError((error) {
      emit(ErrorGetServicesState(error));
    });
  }

  List<ServiceModel> electricityList = [];
  List<ServiceModel> allList = [];

  Future<void> getElectricity() async {
    electricityList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Electricity')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        electricityList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> pipesList = [];

  Future<void> getPipes() async {
    electricityList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Pipes')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        pipesList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> conditionerList = [];

  Future<void> getConditioners() async {
    conditionerList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Conditioners')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        conditionerList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> maintenanceList = [];

  Future<void> getMaintenance() async {
    maintenanceList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Maintenance')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        maintenanceList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> paintList = [];

  Future<void> getPaint() async {
    paintList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('Paint')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        paintList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> cleanerList = [];

  Future<void> getHouseCleaning() async {
    cleanerList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('1')
        .collection('House_Cleaning')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        cleanerList.add(ServiceModel.fromJson(element.data()));
        allList.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<DeliveryModel> all2List = [];
  List<DeliveryModel> listRestaurants = [];

  Future<void> getRestaurants() async {
    listRestaurants = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('2')
        .collection('Restaurants')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listRestaurants.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<DeliveryModel> listCafes = [];

  Future<void> getCafes() async {
    listCafes = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('2')
        .collection('Cafes')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listCafes.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<DeliveryModel> marketList = [];

  Future<void> getMarkets() async {
    marketList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('2')
        .collection('Market')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        marketList.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<DeliveryModel> listDelivery = [];

  Future<void> getDelivery() async {
    listDelivery = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('2')
        .collection('Delivery_Companies')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        listDelivery.add(DeliveryModel.fromJson(element.data()));
        all2List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  void logoutUser() async {
    emit(LoadingLogoutState());
    await FirebaseAuth.instance.signOut().then((value) {
      emit(SuccessLogoutState());
    }).catchError((error) {
      emit(ErrorLogoutState(error.toString()));
    });
  }
}
