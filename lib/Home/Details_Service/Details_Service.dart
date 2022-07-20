import 'package:flutter/material.dart';
import 'package:smart_service/Home/Home_Screen.dart';
import 'package:smart_service/constant.dart';
import 'package:unicons/unicons.dart';

class DetailsService extends StatelessWidget {
  const DetailsService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: const Color(0xffF6C52F),
      //   title: const Text(
      //     'خدمة صيانة المنازل',
      //     style: TextStyle(
      //       fontFamily: 'Tajawal',
      //       fontSize: 20,
      //       color: const Color(0xff0f0a39),
      //       fontWeight: FontWeight.w700,
      //       height: 0.6,
      //     ),
      //     textHeightBehavior:
      //         TextHeightBehavior(applyHeightToFirstAscent: false),
      //     textAlign: TextAlign.right,
      //     softWrap: false,
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.search,
      //       ),
      //     ),
      //   ],
      //   iconTheme: const IconThemeData(
      //     color: Color(0xff0F0A39),
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffF6C52F),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        40,
                      ),
                      bottomLeft: Radius.circular(
                        40,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.08,
                          right: size.width * 0.05,
                          child: IconButton(
                            onPressed: () {
                              navigatorFinished(context, const HomeScreen());
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.1,
                          right: size.width * 0.2,
                          child: const Text(
                            'خدمة صيانة المنازل',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 20,
                              color: const Color(0xff0f0a39),
                              fontWeight: FontWeight.w700,
                              height: 0.6,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.right,
                            softWrap: false,
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.08,
                          left: size.width * 0.02,
                          child: IconButton(
                            onPressed: () {
                              navigatorFinished(context, const HomeScreen());
                            },
                            icon: const Icon(
                              UniconsLine.search,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.15,
                          right: size.width * 0.08,
                          child: Container(
                            height: size.height * 0.035,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                color: const Color(0xffE0E0E0),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'كهرباء',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 14,
                                  color: Color(0xff5300bf),
                                  letterSpacing: -0.33764714050292965,
                                ),
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.24,
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                  child: Container(
                    height: size.height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const Text(
                                'كهرباء',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 21,
                                  color: const Color(0xff383838),
                                  fontWeight: FontWeight.w700,
                                  height: 1.2380952380952381,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                                softWrap: false,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  UniconsLine.circle,
                                  color: Color(0xff707070),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color(0xffBDC4CC),
                          height: 0.5,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'اصلاح أعطال الطبلون',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xff383838),
                              height: 1.625,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              const Text(
                                '350-200',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                  height: 1.9166666666666667,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                              const Text(
                                'شيكل',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 12,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                  height: 1.9166666666666667,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  UniconsLine.minus_circle,
                                  color: Color(0xff5300BF),
                                  size: 25,
                                ),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 20,
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                  height: 2.5,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  UniconsLine.plus_circle,
                                  size: 25,
                                  color: Color(0xff5300BF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.1,
            width: double.infinity,
            color: Color(0xffFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: ()
                    {
                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: const Color(0xff5300BF),
                        ),
                        child: const Center(
                          child: Text(
                            'التالي',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
