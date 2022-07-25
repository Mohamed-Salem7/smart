import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/modules/Home/cubit/cubit.dart';

import '../modules/Home/cubit/state.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          return BuildCondition(
            condition: HomeCubit.get(context).userModel != null,
            builder: (context) => Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.22,
                          decoration: const BoxDecoration(
                            color: Color(0xffF6C52F),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                50,
                              ),
                              bottomRight: Radius.circular(
                                50,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.155,
                          right: size.width * 0.25,
                          child: const Text(
                            'عنا',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 20,
                              color: const Color(0xff0f0a39),
                              fontWeight: FontWeight.w700,
                              height: 1.6,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.15,
                          right: size.width * 0.1,
                          child: const Icon(Icons.info_outlined),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'من نحن',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                              color: const Color(0xff5300bf),
                              fontWeight: FontWeight.w700,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 2.5,
                                  blurRadius: 10,
                                ),
                              ],
                              color: const Color(0xffffffff),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.02,
                                  right: size.width * 0.04,
                                  left: size.width * 0.04),
                              child: const Text(
                                'شركة أبل (بالإنجليزية: .Apple Inc)‏ أو أبل (Apple) هي شركة تقنية أمريكية متعددة الجنسيات متخصصة في الإلكترونيات الاستهلاكية، البرامج والخدمات عبر الإنترنت ومقرها في كوبرتينو، كاليفورنيا، الولايات المتحدة. تعد أبل أكبر شركة لتكنولوجيا المعلومات من حيث الإيرادات (بإجمالي 365٫8 مليار دولار أمريكي في عام 2021) واعتبارًا من مايو 2022، أصبحت ثاني أكبر شركة في العالم من حيث القيمة، رابع أكبر بائع لأجهزة الكمبيوتر الشخصية من حيث مبيعات الوحدات وثاني أكبر شركة الشركة المصنعة للهاتف المحمول. إنها واحدة من أكبر خمس شركات تكنولوجيا المعلومات الأمريكية، إلى جانب ألفابت، أمازون، ميتا، ومايكروسوفت. ',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 14,
                                  color: const Color(0xff7b7890),
                                  height: 2.142857142857143,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'خدماتنا',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                              color: const Color(0xff5300bf),
                              fontWeight: FontWeight.w700,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 2.5,
                                  blurRadius: 10,
                                ),
                              ],
                              color: const Color(0xffffffff),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      right: size.width * 0.04,
                                      left: size.width * 0.04),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                        color: Color(0xff5300bf),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'اطلب ما تريد من خدمات',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xff7b7890),
                                          height: size.height * 0.0016,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: size.height * 0.03,
                                  color: Color(0xffE2E2E2),
                                  thickness: size.height * 0.0006,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width * 0.04,
                                      left: size.width * 0.04),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                        color: Color(0xff5300bf),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'توصيل الخدمة مجاني',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xff7b7890),
                                          height: size.height * 0.0016,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: size.height * 0.03,
                                  color: Color(0xffE2E2E2),
                                  thickness: size.height * 0.0006,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width * 0.04,
                                      left: size.width * 0.04),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                        color: Color(0xff5300bf),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'الدفع عند الاستلام',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xff7b7890),
                                          height: size.height * 0.0016,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            'تواصل معنا',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                              color: const Color(0xff5300bf),
                              fontWeight: FontWeight.w700,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.223,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 2.5,
                                  blurRadius: 10,
                                ),
                              ],
                              color: const Color(0xffffffff),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    right: size.width * 0.04,
                                    left: size.width * 0.04,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'رقم الهاتف',
                                        style: const TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xff383838),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.right,
                                        softWrap: false,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.007,
                                      ),
                                      Text(
                                        '+972597686355',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xa8000000),
                                          height: size.height * 0.0016,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: size.height * 0.03,
                                  color: Color(0xffE2E2E2),
                                  thickness: size.height * 0.0006,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width * 0.04,
                                      left: size.width * 0.04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'البريد الإلكتروني',
                                        style: const TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xff383838),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.right,
                                        softWrap: false,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.007,
                                      ),
                                      Text(
                                        HomeCubit.get(context).userModel!.email,
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xa8000000),
                                          height: size.height * 0.0016,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: size.height * 0.03,
                                  color: Color(0xffE2E2E2),
                                  thickness: size.height * 0.0006,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width * 0.04,
                                      left: size.width * 0.04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'موقعنا',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xff383838),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textHeightBehavior: TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.right,
                                        softWrap: false,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.007,
                                      ),
                                      Text(
                                        'https://www.facebook.com/mohamed.salem.010/',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 14,
                                          color: const Color(0xa8000000),
                                          height: size.height * 0.0016,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
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
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
