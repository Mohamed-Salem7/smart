import 'package:flutter/material.dart';

import '../Shared/constant.dart';

class ProviderLanguage with ChangeNotifier {

  String language = 'العربية';
  Map<String, Object> textAr = {
    "Home": "الرئيسية",
    "Notification": "إشعارات",
    "About_Us": "عنا",
    "Settings": "إعدادات",
    "Select_your_location": "حدد موقعك",
    "Hello": "مرحباً,",
    "How_We_can_Help_you": "كيف يمكننا مساعدتك؟",
    "What_service_are_you_looking_for": "ما الخدمة التي تبحث عنها",
    "Details_about_service": "تفاصيل عن الخدمة",
    "Language": "اللغة",
    "Rating": "تقييمك لخدماتنا",
    "Help": "طلب مساعدة",
    "Logout" : "خروج",
    "We" : "من نحن",
    "Dec" : "شركة أبل هي شركة تقنية أمريكية متعددة الجنسيات متخصصة في الإلكترونيات الاستهلاكية، البرامج والخدمات عبر الإنترنت ومقرها في كوبرتينو، كاليفورنيا، الولايات المتحدة. تعد أبل أكبر شركة لتكنولوجيا المعلومات من حيث الإيرادات (بإجمالي 365٫8 مليار دولار أمريكي في عام 2021) واعتبارًا من مايو 2022، أصبحت ثاني أكبر شركة في العالم من حيث القيمة، رابع أكبر بائع لأجهزة الكمبيوتر الشخصية من حيث مبيعات الوحدات وثاني أكبر شركة الشركة المصنعة للهاتف المحمول. إنها واحدة من أكبر خمس شركات تكنولوجيا المعلومات الأمريكية، إلى جانب ألفابت، أمازون، ميتا، ومايكروسوفت.",
    "Our_Services" : "خدماتنا",
    "Service1" : "إطلب ما تريد من خدمات",
    "Service2" : "توصيل الخدمة مجاناً",
    "Service3" : "الدفع عند الإستلام",
    "Connect" : "تواصل معنا",
    "Phone" : "رقم الهاتف",
    "Email" : "البريد الإلكتروني",
    "Url" : "موقعنا",
  };
  Map<String, Object> textEn = {
    "Home": "Home",
    "Notification": "Notification",
    "About_Us": "About Us",
    "Settings": "Settings",
    "Select_your_location": "Select your location",
    "Hello": "Hello,",
    "How_We_can_Help_you": "How We can Help you?",
    "What_service_are_you_looking_for": "What service are you looking for",
    "Details_about_service": "Details about service",
    "Language": "Language",
    "Rating": "Your evaluation of our services",
    "Help": "Asked assistant",
    "Logout" : "Logout",
    "We" : "who are we",
    "Dec" : "The Apple Corporation is an American multinational technology company specializing in consumer electronics, software and online services, headquartered in Cupertino, California, United States. Apple is the largest IT company by revenue (totaling \$365.8 billion in 2021) and as of May 2022, it is the world's second-largest company by value, the fourth-largest seller of personal computers by unit sales and the second-largest company mobile phone manufacturer. It is one of the top five US IT companies, along with Alphabet, Amazon, Meta, and Microsoft.",
    "Our_Services" : "Our Services",
    "Service1" : "Ask for the services you want",
    "Service2" : "Free delivery service",
    "Service3" : "Paiement when recieving",
    "Connect" : "Connect with us",
    "Phone" : "Phone Number",
    "Email" : "Email",
    "Url" : "The our site",
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
