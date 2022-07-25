import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/models/Service_Model.dart';
import 'package:smart_service/modules/Home/cubit/cubit.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';
import 'package:unicons/unicons.dart';

import 'Details_Order.dart';

class DetailsService extends StatelessWidget {
  const DetailsService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getElectricity()
        ..getPipes()
        ..getConditioners()
        ..getMaintenance()
        ..getPaint()
        ..getHouseCleaning(),
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
                          height: size.height * 0.32,
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
                                horizontal: size.width * 0.02),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      top: size.height * 0.08,
                                      right: size.width * 0.05,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
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
                                      start: size.width * 0.06),
                                  child: Container(
                                    height: size.height * 0.115,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.08,
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
                        if (HomeCubit.get(context).nameIndex == 0)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount: HomeCubit.get(context).allList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).allList[index],
                              ),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 1)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).electricityList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).electricityList[index],
                              ),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 2)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).pipesList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).pipesList[index],
                              ),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 3)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).conditionerList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).conditionerList[index],
                              ),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 4)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).maintenanceList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).maintenanceList[index],
                              ),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 5)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).paintList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).paintList[index],
                              ),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 6)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).cleanerList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                context,
                                size,
                                HomeCubit.get(context).cleanerList[index],
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
                            onTap: () {
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

Widget buildProduct(
        BuildContext context, Size size, ServiceModel serviceModel) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        children: [
          Container(
            height: size.height * 0.24,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset.fromDirection(
                      1.5,
                      10,
                    ),
                    spreadRadius: 0,
                    blurRadius: 10.0),
              ],
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.height * 0.005),
                  child: Row(
                    children: [
                      Text(
                        serviceModel.title,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 21,
                          color: Color(0xff383838),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
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
                const Divider(
                  color: Color(0xffBDC4CC),
                  height: 0.5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.height * 0.005),
                  child: Text(
                    serviceModel.name,
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
                      Text(
                        serviceModel.price,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 12,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.002,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
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
                            TextHeightBehavior(applyHeightToFirstAscent: false),
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
                          color: Color(0xff000000),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.025,
                      vertical: size.height * 0.005),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'إجمالي المبلغ : ',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 12,
                          color: const Color(0xff5300bf),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.002,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
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
                            TextHeightBehavior(applyHeightToFirstAscent: false),
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
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );
