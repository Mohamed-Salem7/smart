import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unicons/unicons.dart';

class ProviderLanguage with ChangeNotifier {
  bool isAr = true;
  String language = 'العربية';
  Map<String, Object> textAr = {
    "Home": "الرئيسية",
    "Notification": "إشعارات",
    "About_Us": "عنا",
    "Settings": "إعدادات",
    "Select your location": "حدد موقعك",
    "Hello": "مرحباً,",
    "Hello": "مرحباً,",
  };
  Map<String, Object> textEn = {
    "Home": "Home",
    "Notification": "Notification",
    "About_Us": "About Us",
    "Settings": "Settings",
    "Select your location": "Select your location",
    "Hello": "Hello,",
  };

  changeLanguage(bool language) {
    isAr = language;
    notifyListeners();
  }

  changeLan(String lang) {
    if (language != lang) isAr = !isAr;
    language = lang;
    notifyListeners();
  }

  Object? getText(String text) {
    if (isAr == true) {
      return textAr[text];
    }
    return textEn[text];
  }
}
