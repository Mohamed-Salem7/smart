import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/layout/Login/Register.dart';
import 'package:smart_service/layout/Login/Screen_Verifying1.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/modules/Login/cubit/cubit.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';
import 'package:unicons/unicons.dart';

import '../../modules/Home/cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is SuccessLoginState) {
          navigatorFinished(context, const Verifying2());
        }
      }, builder: (context, state) {
        return Form(
          //key: formKey,
          child: Scaffold(
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
                            'البريد الإلكتروني',
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
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.895,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: TextFormField(
                                controller: emailController,
                                onTap: () {},
                                textAlign: TextAlign.end,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null) {
                                    return 'رجاءا أدخل بريدك الإلكتروني';
                                  }
                                  return null;
                                },
                                maxLengthEnforcement: MaxLengthEnforcement
                                    .truncateAfterCompositionEnds,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xff5300BF),
                                  ),
                                  hintText: 'ahmed@hotmail.com',
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
                        ),
                        Positioned(
                          top: size.height * 0.58,
                          right: size.width * 0.06,
                          child: const Text(
                            'كلمة المرور',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color: const Color(0xff7b7890),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.61,
                          right: size.width * 0.06,
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.895,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffF5F6FA),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              child: TextFormField(
                                controller: passwordController,
                                onTap: () {},
                                textAlign: TextAlign.end,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null) {
                                    return 'رجاءا أدخل كلمة المرور';
                                  }
                                  return null;
                                },
                                maxLengthEnforcement: MaxLengthEnforcement
                                    .truncateAfterCompositionEnds,
                                obscureText: LoginCubit.get(context).isPassword,
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Color(0xff5300BF),
                                  ),
                                  prefixIcon: LoginCubit.get(context).suffix != null ? IconButton(
                                    onPressed: ()
                                    {
                                      LoginCubit.get(context).changeVisibilityPassword();
                                    },
                                    icon:  Icon(
                                      LoginCubit.get(context).suffix,
                                      color: Color(0xff5300BF),
                                    ),
                                  ) : null,
                                  hintText: '******',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16,
                                    color: Color(0xffEEDFF9),
                                  ),
                                ),
                                style:  const TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16,
                                  //height: size.height * 0.0055,
                                  color: Color(0xff0F0A39),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.7,
                          right: size.width * 0.06,
                          child: BuildCondition(
                            condition: state is! LoadingLoginState,
                            builder: (context) => Container(
                              width: size.width * 0.895,
                              child: ElevatedButton(
                                clipBehavior: Clip.hardEdge,
                                onPressed: () {
                                  LoginCubit.get(context).loginUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
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
                                      height: 2),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                              ),
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.76,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06),
                            child: Row(
                              children: [
                                const Text(
                                  'ليس لديك حساب؟',
                                  style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 14,
                                    color: const Color(0xff7b7890),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    navigatorFinished(
                                        context, const RegisterScreen());
                                  },
                                  child: const Text(
                                    'تسجيل',
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: const Color(0xff5300BF),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
