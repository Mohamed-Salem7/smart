import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/layout/Main_Screen.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';

import '../../modules/Login/cubit/cubit.dart';

class RegisterDealer extends StatelessWidget {
  const RegisterDealer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var locationController = TextEditingController();
    var priceServiceController = TextEditingController();
    var detailsServiceController = TextEditingController();
    var streetController = TextEditingController();
    var timeJobController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'تسجيل مزود خدمة',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20,
                  color: Color(0xff0f0a39),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
                softWrap: false,
              ),
              iconTheme: const IconThemeData(
                color: Color(0xff0f0a39),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0525,
                  vertical: size.height * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Text(
                    'يرجى ادخال بياناتك',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 28,
                      color: const Color(0xff0f0a39),
                      fontWeight: FontWeight.w700,
                      height: size.height * 0.002,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'يمكنك كتابة اسم المستخدم في الخانة المخصصة له أدناه',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color: Color(0xff7b7890),
                      height: size.height * 0.002,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'الاسم',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: size.height * 0.001,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: TextFormField(
                              onTap: () {},
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل إسمك';
                                }
                                return null;
                              },
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                height: size.height * 0.002,
                                fontSize: 16,
                                color: const Color(0xff0f0a39),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,
                                hintText: 'أدخل إسمك',
                                hintStyle: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: const Color(0xffcbc9d9),
                                  height: size.height * 0.001,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'البريد الإلكتروني',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff7b7890),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: TextFormField(
                              controller: emailController,
                              onTap: () {},
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل بريدك الإلكتروني';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,
                                hintText: 'أدخل بريدك الإلكتروني',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                ),
                              ),

                              style:  TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                height: size.height * 0.001,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'كلمة المرور',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff7b7890),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: TextFormField(
                              controller: passwordController,
                              onTap: () {},
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل كلمة المرور';
                                }
                                return null;
                              },
                              obscureText: LoginCubit.get(context).isPassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,

                                suffixIcon:
                                    LoginCubit.get(context).suffix != null
                                        ? IconButton(
                                            onPressed: () {
                                              LoginCubit.get(context)
                                                  .changeVisibilityPassword();
                                            },
                                            icon: Icon(
                                              LoginCubit.get(context).suffix,
                                              color: Color(0xffF6C52F),
                                            ),
                                          )
                                        : null,
                                hintText: 'أدخل كلمة المرور',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                //height: size.height * 0.0055,
                                color: Color(0xff0F0A39),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'رقم الجوال',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: size.height * 0.003,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.02,
                                    vertical: size.height * 0.01),
                                child: Container(
                                  width: size.width * 0.55,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return 'رجاءا أدخل رقم هاتفك';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: Color(0xff0f0a39),
                                    ),

                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffF5F6FA),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20,),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20,),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'رقم الجوال',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: Color(0xffcbc9d9),
                                        height: size.height * 0.001,
                                      ),
                                    ),
                                    onTap: () {},
                                    keyboardType: TextInputType.phone,
                                    controller: phoneController,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F6FA),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01),
                                  child: const Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Text(
                                      '+972',
                                      style: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: Color(0xffcbc9d9),
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.end,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'الموقع',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: size.height * 0.003,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,

                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.75,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return 'رجاءا أدخل موقعك';
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: Color(0xff0f0a39),
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffF5F6FA),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20,),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20,),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'أدخل موقعك',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: Color(0xffcbc9d9),
                                        height: size.height * 0.001,
                                      ),
                                    ),
                                    onTap: () {},
                                    keyboardType: TextInputType.streetAddress,
                                    controller: locationController,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.025,
                              ),
                              const CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xffF6C52F),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'إختيار الخدمة',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: size.height * 0.003,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          Row(
                            children: [
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.435,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F6FA),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.02,
                                      vertical: size.height * 0.01),
                                  child: Text(
                                    'الخدمة',
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: const Color(0xffcbc9d9),
                                      height: size.height * 0.01,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.right,
                                    softWrap: false,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.435,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffF5F6FA),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'سعر الخدمة',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: size.height * 0.001,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل سعر خدمتك';
                                }
                                return null;
                              },
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                color: Color(0xff0f0a39),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,
                                hintText: 'أدخل سعر الخدمة',
                                hintStyle: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                  height: size.height * 0.001,
                                ),
                              ),
                              onTap: () {},
                              keyboardType: TextInputType.number,
                              controller: priceServiceController,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'تفاصيل الخدمة',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: 1.7142857142857142,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل تفاصيل خدمتك';
                                }
                                return null;
                              },
                              maxLines: 5,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                color: Color(0xff0f0a39),
                                overflow: TextOverflow.ellipsis,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,
                                hintText: ' أدخل تفاصيل الخدمة الخاصة بك',
                                hintStyle: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                  height: size.height * 0.001,
                                ),
                              ),
                              onTap: () {},
                              controller: detailsServiceController,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'العنوان',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: 1.7142857142857142,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل عنوانك';
                                }
                                return null;
                              },
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                color: Color(0xff0f0a39),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,
                                hintText: 'أدخل العنوان',
                                hintStyle: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                  height: size.height * 0.001,
                                ),
                              ),
                              onTap: () {},
                              keyboardType: TextInputType.streetAddress,
                              controller: streetController,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'وقت العمل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xff7b7890),
                              height: 1.7142857142857142,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'رجاءا أدخل وقت العمل';
                                }
                                return null;
                              },
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 16,
                                color: Color(0xff0f0a39),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F6FA),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20,),
                                ),
                                border: InputBorder.none,
                                hintText: 'أدخل وقت العمل',
                                hintStyle: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  color: Color(0xffcbc9d9),
                                  height: size.height * 0.001,
                                ),
                              ),
                              onTap: () {},
                              controller: timeJobController,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          InkWell(
                            onTap: () {
                              navigatorFinished(context, MainScreen());
                            },
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.895,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff5300BF),
                              ),
                              child: const Center(
                                child: Text(
                                  'تسجيل مزود الخدمة',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    height: 1.5,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
