import 'package:flutter/material.dart';
import 'package:smart_service/Login/Register_Cliente.dart';
import 'package:smart_service/Login/Register_Dealer.dart';
import 'package:smart_service/constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'تسجيل مستخدم جديد',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 20,
            color: Color(0xff0f0a39),
            fontWeight: FontWeight.w700,
            height: size.height * 0.001,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.right,
          softWrap: false,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff0f0a39),
        ),
        actionsIconTheme: IconThemeData(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0525,vertical: size.height * 0.02),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.13,
                ),
                 Text(
                  'تسجيل مستخدم جديد',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 28,
                    color: Color(0xff0f0a39),
                    fontWeight: FontWeight.w700,
                    height: size.height * 0.0025,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  width: size.width * 0.895,
                  child:  Text(
                    'يمكنك اختيار  تسجيل بياناتك كعميل أو مزود خدمة',
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 20,
                      color: const Color(0xff7b7890),
                      height: size.height * 0.002,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                InkWell(
                  onTap: ()
                  {
                    navigatorTo(context, const RegisterCliente());
                  },
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.895,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xff5300BF),
                            offset: Offset(
                              0.5,
                              0.5,
                            ),
                            blurRadius: 0.5,
                            blurStyle: BlurStyle.solid),
                        BoxShadow(
                            color: Color(0xff5300BF),
                            offset: Offset(
                              -0.5,
                              -0.5,
                            ),
                            blurRadius: 0.5,
                            blurStyle: BlurStyle.solid),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'عميل',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          color: const Color(0xff5300bf),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.0015,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
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
                    navigatorTo(context, const RegisterDealer());
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
                        'مزود خدمة',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.35,
                  width: size.width * 0.895,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/login.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
