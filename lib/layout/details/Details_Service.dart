import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/layout/details/Details_Order.dart';
import 'package:smart_service/layout/Main_Screen.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/modules/Home/cubit/cubit.dart';
import 'package:unicons/unicons.dart';

import '../../modules/Home/cubit/state.dart';

class DetailsService extends StatelessWidget {
  const DetailsService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isShow = true;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
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
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02,
                                vertical: size.height * 0.01),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Stack(
                                  children: [
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
                                      right: size.width * 0.05,
                                      child: IconButton(
                                        onPressed: () {
                                          navigatorFinished(
                                              context, const MainScreen());
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: size.height * 0.08,
                                      left: size.width * 0.02,
                                      child: IconButton(
                                        onPressed: () {
                                          //navigatorFinished(context, const HomeScreen());
                                        },
                                        icon: const Icon(
                                          UniconsLine.search,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: size.width * 0.06,
                                      top: size.height * 0.06),
                                  child: SizedBox(
                                    height: size.height * 0.115,
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.05,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              HomeCubit.get(context)
                                                  .changeName(index);
                                            },
                                            child: Container(
                                              height: size.height * 0.035,
                                              width: size.width * 0.2,
                                              decoration: BoxDecoration(
                                                  color: color(index, context),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Text(
                                                  HomeCubit.get(context)
                                                      .name[index],
                                                  style: TextStyle(
                                                    fontFamily: 'Tajawal',
                                                    fontSize: 14,
                                                    color:
                                                        color2(index, context),
                                                    letterSpacing:
                                                        -0.33764714050292965,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  softWrap: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      itemCount:
                                          HomeCubit.get(context).name.length,
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
                            height: isShow ? size.height * 0.22 : size.height * 0.2 ,
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
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      right: size.width * 0.02,
                                      left: size.width * 0.02),
                                  child: Row(
                                    children: [
                                      Text(
                                        HomeCubit.get(context).name[
                                            HomeCubit.get(context).nameIndex],
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 21,
                                          color: Color(0xff383838),
                                          fontWeight: FontWeight.w700,
                                          height: size.height * 0.0015,
                                        ),
                                        textHeightBehavior:
                                            const TextHeightBehavior(
                                                applyHeightToFirstAscent:
                                                    false),
                                        textAlign: TextAlign.right,
                                        softWrap: false,
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          UniconsLine.circle,
                                          color: Color(0xff707070),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Color(0xffBDC4CC),
                                  height: size.height * 0.001,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'اصلاح أعطال الطبلون',
                                    style: TextStyle(
                                      fontFamily: 'Tajawal',
                                      fontSize: 16,
                                      color: Color(0xff383838),
                                      height: size.height * 0.002,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.025),
                                  child: Row(
                                    children: [
                                      Text(
                                        '350-200',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 12,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w700,
                                          height: size.height * 0.002,
                                        ),
                                        textHeightBehavior:
                                            const TextHeightBehavior(
                                                applyHeightToFirstAscent:
                                                    false),
                                        textAlign: TextAlign.right,
                                      ),
                                      Text(
                                        'شيكل',
                                        style: TextStyle(
                                          fontFamily: 'Tajawal',
                                          fontSize: 12,
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w700,
                                          height: size.height * 0.002,
                                        ),
                                        textHeightBehavior:
                                            const TextHeightBehavior(
                                                applyHeightToFirstAscent:
                                                    false),
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
                                          height: size.height * 0.003,
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
                                if (isShow)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.025),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          ' إجمالي المبلغ :',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 12,
                                            color: const Color(0xff5300bf),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.0025,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          '400',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 12,
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.002,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.right,
                                        ),
                                        Text(
                                          'شيكل',
                                          style: TextStyle(
                                            fontFamily: 'Tajawal',
                                            fontSize: 12,
                                            color: const Color(0xff000000),
                                            fontWeight: FontWeight.w700,
                                            height: size.height * 0.0025,
                                          ),
                                          textHeightBehavior:
                                              const TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          textAlign: TextAlign.right,
                                        )
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
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0525,
                          vertical: size.height * 0.02),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: ()
                            {
                              navigatorTo(context, const DetailsOrder());
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
          }),
    );
  }
}

Color color(int i, context) {
  if (i == HomeCubit.get(context).nameIndex) return Color(0xff5300BF);

  return Color(0xffE0E0E0);
}

Color color2(int i, context) {
  if (i != HomeCubit.get(context).nameIndex) return Color(0xff5300BF);

  return Color(0xffE0E0E0);
}
