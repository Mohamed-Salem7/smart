import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Login/Screen_Verifying1.dart';
import 'package:smart_service/Login/cubit/cubit.dart';
import 'package:smart_service/Login/cubit/state.dart';
import 'package:smart_service/constant.dart';

class VerifyingCode extends StatelessWidget {
  const VerifyingCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var phoneController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/background2.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: size.height * 0.2,
                            right: size.width * 0.3,
                            left: size.width * 0.3,
                            child: Image(
                              image: const AssetImage(
                                'assets/images/smarts.png',
                              ),
                              fit: BoxFit.contain,
                              height: size.height * 0.15,
                              width: size.width * 0.35,
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.4,
                            right: size.width * 0.3,
                            left: size.width * 0.3,
                            child: const Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.w700,
                                //color: Color(0xff5300BF),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.48,
                            right: size.width * 0.06,
                            child: const Text(
                              'رقم الجوال',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: const Color(0xff7b7890),
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.51,
                            right: size.width * 0.06,
                            child: Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF5F6FA),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextFormField(
                                      controller: phoneController,
                                      onTap: () {},
                                      textAlign: TextAlign.end,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please enter your Phone';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '597788221',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 16,
                                          color: Color(0xffEEDFF9),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontFamily: 'Tajawal',
                                        fontSize: 16,
                                        color: Color(0xff0F0A39),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffF5F6FA),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        '972+',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 16,
                                          color: Color(0xff0F0A39),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.65,
                            right: size.width * 0.06,
                            child: Container(
                              width: size.width * 0.8,
                              child: ElevatedButton(
                                clipBehavior: Clip.hardEdge,
                                onPressed: ()
                                {
                                  navigatorTo(context, Verifying2());
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(
                                      (0xff5300BF),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 18,
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    height: 2
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
                ],
              ),
            );
          }),
    );
  }
}
