import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
                  top: size.height * 0.2,
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
                  top: size.height * 0.23,
                  right: size.width * 0.1,
                  child: const Text(
                    'نقدم لكم لمحة عنا',
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
                  top: size.height * 0.3,
                  right: size.width * 0.07,
                  left: size.width * 0.07,
                  child: Container(
                    height: size.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                      color: const Color(0xffffffff),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15.0,right: 15,left: 5),
                      child: Text(
                        'شركة أبل (بالإنجليزية: .Apple Inc)‏ أو أبل (Apple) هي شركة تقنية أمريكية متعددة الجنسيات متخصصة في الإلكترونيات الاستهلاكية، البرامج والخدمات عبر الإنترنت ومقرها في كوبرتينو، كاليفورنيا، الولايات المتحدة. تعد أبل أكبر شركة لتكنولوجيا المعلومات من حيث الإيرادات (بإجمالي 365٫8 مليار دولار أمريكي في عام 2021) واعتبارًا من مايو 2022، أصبحت ثاني أكبر شركة في العالم من حيث القيمة، رابع أكبر بائع لأجهزة الكمبيوتر الشخصية من حيث مبيعات الوحدات وثاني أكبر شركة الشركة المصنعة للهاتف المحمول. إنها واحدة من أكبر خمس شركات تكنولوجيا المعلومات الأمريكية، إلى جانب ألفابت، أمازون، ميتا، ومايكروسوفت. ',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 17,
                          color: const Color(0xff5300bf),
                          fontWeight: FontWeight.w700,
                          height: 2,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
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
