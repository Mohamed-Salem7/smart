import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:smart_service/language/language.dart';
import 'package:smart_service/layout/About_Us.dart';
import 'package:smart_service/layout/Home_Screen.dart';
import 'package:smart_service/layout/Settings_Screen.dart';
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

  //static BuildContext get context =>  BlocProvider.of(context);

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
  List<String> names = [
    'All',
    'Electric',
    'Pipes',
    'Conditionneurs',
    'Maintenance',
    'Peinture',
    'Cleaning House'
  ];

  List<String> name2 = [
    'الكل',
    'مطاعم',
    'كافيهات',
    'سوبر ماركت',
    'شركات توصيل',
  ];
  List<String> names2 = [
    'All',
    'Restaurants',
    'Cafes',
    'Market',
    'Companies Delivery',
  ];

  List<String> name3 = [
    'الكل',
    'مراكز تعليمية',
    'أساتذة خاص',
  ];
  List<String> names3 = [
    'All',
    'Center Education',
    'Private Teachers',
  ];

  List<String> name4 = [
    'الكل',
    'مراكز تسوق',
    'محلات أحذية',
    'محلات ملابس',
  ];
  List<String> names4 = [
    'All',
    'Center Shop',
    'shoe stores',
    'clothes shop',
  ];


  List<String> name5 = [
    'الكل',
    'خدمات وقائية',
    'خدمات تأهيلية',
  ];
  List<String> names5 = [
    'All',
    'Preventive services',
    'Rehabilitation services',
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
  List<String> items2 = [
    'English',
    'العربية',
  ];



  Set<Marker> markers={};

  void MyLocation({required double latitude,required double longitude}){
    markers.add(
      Marker(
        markerId: MarkerId('My Location'),
        position: LatLng(latitude, longitude),
      ),
    );
    emit(SuccessLocation());
  }
  void logoutUser() async {
    emit(LoadingLogoutState());
    await FirebaseAuth.instance.signOut().then((value) {
      emit(SuccessLogoutState());
    }).catchError((error) {
      emit(ErrorLogoutState(error.toString()));
    });
  }

  bool isSelect = false;

  Icon select = const Icon(Icons.radio_button_off);
  List<int> num =[];
  changeSelect() {
    isSelect = !isSelect;
    select = isSelect
        ? const Icon(
            Icons.radio_button_on,
            color: Color(0xff5300BF),
          )
        : const Icon(
            Icons.radio_button_off,
            color: Color(0xff707070),
          );
    emit(ChangeSelectItem());
  }

  int count = 0;


  void incrementItem() {
    count++;
    emit(IncrementSelectItem());
  }

  void decrementItem() {
    if (count >= 1) count--;
    emit(DecrementSelectItem());
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
      icon: Icon(UniconsLine.home_alt),
      label: 'الرئيسية',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.notification),
      label: 'الإشعارات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.info_circle),
      label: 'عنا',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.setting),
      label: 'إعدادات',
    ),
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


  List<ServiceModel> educationList = [];
  List<ServiceModel> all3List = [];

  Future<void> getEducationCenter() async {
    educationList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('3')
        .collection('Educational_Center')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        educationList.add(ServiceModel.fromJson(element.data()));
        all3List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> privateTeacherList = [];

  Future<void> getPrivateTeacher() async {
    privateTeacherList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('3')
        .collection('Teacher')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        privateTeacherList.add(ServiceModel.fromJson(element.data()));
        all3List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }


  List<DeliveryModel> all4List = [];
  List<DeliveryModel> shopList = [];

  Future<void> getShopCenter() async {
    shopList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('4')
        .collection('Shopping_Centers')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        shopList.add(DeliveryModel.fromJson(element.data()));
        all4List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<DeliveryModel> clothesList = [];

  Future<void> getClothesCenter() async {
    clothesList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('4')
        .collection('Clothes')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        clothesList.add(DeliveryModel.fromJson(element.data()));
        all4List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<DeliveryModel> shoesList = [];

  Future<void> getShoesCenter() async {
    shoesList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('4')
        .collection('Shoes')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        shoesList.add(DeliveryModel.fromJson(element.data()));
        all4List.add(DeliveryModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> all5List = [];
  List<ServiceModel> preventiveList = [];

  Future<void> getPreventive() async {
    preventiveList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('5')
        .collection('Preventive_Services')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        preventiveList.add(ServiceModel.fromJson(element.data()));
        all5List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }

  List<ServiceModel> rehabilitationList = [];

  Future<void> getRehabilitation() async {
    rehabilitationList = [];
    emit(LoadingGetServiceState());
    await FirebaseFirestore.instance
        .collection('houses_repair')
        .doc('5')
        .collection('Rehabilitation_Services')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        rehabilitationList.add(ServiceModel.fromJson(element.data()));
        all5List.add(ServiceModel.fromJson(element.data()));
      });
      emit(SuccessGetServiceState());
    }).catchError((error) {
      emit(ErrorGetServiceState(error.toString()));
    });
  }


  // void logoutUser() async {
  //   emit(LoadingLogoutState());
  //   await FirebaseAuth.instance.signOut().then((value) {
  //     emit(SuccessLogoutState());
  //   }).catchError((error) {
  //     emit(ErrorLogoutState(error.toString()));
  //   });
  // }




}
