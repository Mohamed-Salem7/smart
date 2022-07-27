import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rating/rating.dart';
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
                                  //navigatorTo(context, const LanguageScreen());
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
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Color(0xff5300bf),
                                          child: Icon(
                                            Icons.language,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                            Expanded(
                                              child: DropdownButton(
                                                dropdownColor:
                                                    const Color(0xff5300bf),
                                                underline: SizedBox(),
                                                value: homeCubit.language,
                                                onChanged: (value) {
                                                  homeCubit.changeValueLanguage(value as String);
                                                },
                                                items:
                                                    homeCubit.items.map((value) {
                                                  return DropdownMenuItem(
                                                    child: Text(value,style: TextStyle(color: Colors.grey.shade400,),),
                                                    value: value,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        const Center(
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(
                                              0xffCBC9D9,
                                            ),
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
                                onTap: () {
                                  final ratingModel = RatingModel(
                                    id: 1,
                                    title: null,
                                    subtitle: 'Rate our app:',
                                    ratingConfig: RatingConfigModel(
                                      id: 1,
                                      ratingSurvey1: 'What can we improve on?',
                                      ratingSurvey2: 'What can we improve on?',
                                      ratingSurvey3: 'What can we improve on?',
                                      ratingSurvey4: 'What can we improve on?',
                                      ratingSurvey5: 'What you liked the most?',
                                      items: [
                                        RatingCriterionModel(
                                            id: 1, name: 'Quality of service'),
                                        RatingCriterionModel(
                                            id: 2,
                                            name: 'Competence of attendants'),
                                        RatingCriterionModel(
                                            id: 3,
                                            name: 'Cleaning the environment'),
                                        RatingCriterionModel(
                                            id: 4, name: 'Waiting time'),
                                      ],
                                    ),
                                  );
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => RatingWidget(
                                        controller:
                                            MockRatingController(ratingModel)),
                                  );
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
                                          child: Icon(
                                            Iconsax.ranking,
                                            color: Colors.white,
                                          ),
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
                                          child: Icon(
                                            Icons.help_outline,
                                            color: Colors.white,
                                          ),
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
                                onTap: () {
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
                                          child: Icon(
                                            Icons.logout,
                                            color: Colors.white,
                                          ),
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
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        listener: (context, state) {
          if (state is SuccessLogoutState) {
            CacheHelper.removeData(key: 'uId').then((value) {
              navigatorFinished(context, LoginScreen());
            });
          }
        },
      ),
    );
  }
}

class MockRatingController extends RatingController {
  MockRatingController(RatingModel ratingModel) : super(ratingModel);

  @override
  Future<void> ignoreForEverCallback() async {
    print('Rating ignored forever!');
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> saveRatingCallback(
      int rate, List<RatingCriterionModel> selectedCriterions) async {
    print('Rating saved!\nRate: $rate\nsSelectedItems: $selectedCriterions');
    await Future.delayed(const Duration(seconds: 3));
  }
}
