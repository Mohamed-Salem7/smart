import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/Home/Details_Service/Details_Service.dart';
import 'package:smart_service/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var searchController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.35,
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
                  top: size.height * 0.17,
                  right: size.width * 0.08,
                  child: const Text(
                    'مرحباً, منال منصور',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 18,
                      color: const Color(0xff5300bf),
                      fontWeight: FontWeight.w700,
                      height: 2.888888888888889,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                ),
                Positioned(
                  top: size.height * 0.2,
                  right: size.width * 0.08,
                  child: const Text(
                    'كيف يمكننا مساعدتك؟',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 14,
                      color: const Color(0xff0f0a39),
                      height: 2.857142857142857,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  right: size.width * 0.08,
                  left: size.width * 0.08,
                  child: Container(
                    height: size.height * 0.05,
                    decoration: const BoxDecoration(
                      color: Color(0xffF6C52F),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Color(0xff5300BF),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xff5300BF),
                            size: 30,
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          const Text(
                            'حدد موقعك',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xff000000),
                              height: 0.1,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Color(0xff5300BF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.24,
                  right: size.width * 0.08,
                  left: size.width * 0.08,
                  child: Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: const Color(0xffffffff),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        onTap: () {},
                        textAlign: TextAlign.start,
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ما الخدمة التي تبحث عنها',
                          hintStyle: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 16,
                            color: Color(0xffcbc9d9),
                            height: 0.5,
                          ),
                          prefixIcon: Icon(
                            Icons.search_sharp,
                            color: Color(0xffcbc9d9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.32,
                  right: size.width * 0.08,
                  left: size.width * 0.08,
                  child: Container(
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: ()
                        {
                          navigatorTo(context, DetailsService());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: const Color(0xff5300BF),
                              child: Image(
                                image: const AssetImage(
                                  'assets/images/icon.png',
                                ),
                                fit: BoxFit.contain,
                                height: size.height * 0.035,
                                width: size.width * 0.08,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'خدمة صيانة المنازل',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xff383838),
                                    fontWeight: FontWeight.w700,
                                    height: 1.625,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.right,
                                  softWrap: false,
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                const Text(
                                  'تفاصيل عن الخدمة',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 14,
                                    color: Color(0xa8000000),
                                    height: 1.6428571428571428,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.right,
                                ),
                              ],
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
