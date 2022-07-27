import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:smart_service/Shared/cache_helper.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/layout/Login/login.dart';
import 'package:smart_service/layout/Setting/Language_Screen.dart';
import 'package:smart_service/modules/Home/cubit/cubit.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          var size = MediaQuery.of(context).size;
          var homeCubit = HomeCubit.get(context);
          return BuildCondition(
            condition: homeCubit.userModel != null,
            builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.22,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Color(0xffF6C52F),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.15,
                          right: size.width * 0.3,
                          left: size.width * 0.3,
                          child: CircleAvatar(
                            radius: 61,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 58,
                              backgroundImage: NetworkImage(
                                '${homeCubit.userModel?.image}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          homeCubit.userModel!.name,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 18,
                            color: const Color(0xff5300bf),
                            fontWeight: FontWeight.w700,
                            height: size.height * 0.0015,
                          ),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                          homeCubit.userModel!.email,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 14,
                            color: const Color(0xa8000000),
                            height: size.height * 0.0016,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.01),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  navigatorTo(context, const LanguageScreen());
                                },
                                child: Container(
                                  height: size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset.fromDirection(0.5, 0),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Color(0xff5300bf),
                                          child: Icon(Icons.language,color: Colors.white,),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          'اللغة',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 18,
                                            color: const Color(0xff5300bf),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.0015,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color(
                                            0xffCBC9D9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset.fromDirection(0.5, 0),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Color(0xff5300bf),
                                          child: Icon(Iconsax.ranking,color: Colors.white,),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          'تقييمك لخدماتنا',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 18,
                                            color: const Color(0xff5300bf),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.0015,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color(
                                            0xffCBC9D9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset.fromDirection(0.5, 0),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Color(0xff5300bf),
                                          child: Icon(Icons.help_outline,color: Colors.white,),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          'طلب مساعدة',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 18,
                                            color: const Color(0xff5300bf),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.0015,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color(
                                            0xffCBC9D9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              InkWell(
                                onTap: ()
                                {
                                  homeCubit.logoutUser();
                                },
                                child: Container(
                                  height: size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset.fromDirection(0.5, 0),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.red,
                                          child: Icon(Icons.logout,color: Colors.white,),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Text(
                                          'خروج',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 18,
                                            color: const Color(0xff5300bf),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.0015,
                                          ),
                                          textAlign: TextAlign.end,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Color(
                                            0xffCBC9D9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          );
        },
        listener: (context, state)
        {
          if(state is SuccessLogoutState)
          {
            CacheHelper.removeData(key: 'uId').then((value) {
              navigatorFinished(context, LoginScreen());
            });
          }
        },
      ),
    );
  }
}