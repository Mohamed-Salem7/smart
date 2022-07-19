import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  right: size.width * 0.1,
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
                  right: size.width * 0.1,
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
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                  child: Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10,),
                      color: const  Color(0xffffffff),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.24,
                  right: size.width * 0.1,
                  left: size.width * 0.1,
                  child: Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10,),
                      color: const  Color(0xffffffff),
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
