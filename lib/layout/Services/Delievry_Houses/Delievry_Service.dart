import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/layout/Main_Screen.dart';
import 'package:smart_service/layout/Services/Delievry_Houses/Choose_Meal.dart';
import 'package:smart_service/models/Deleviry_Service.dart';
import 'package:smart_service/modules/Home/cubit/cubit.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';
import 'package:unicons/unicons.dart';

import '../../../models/Service_Model.dart';

class DeliveryServiceList extends StatelessWidget {
  const DeliveryServiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getRestaurants()
        ..getCafes()
        ..getMarkets()
        ..getDelivery(),
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
                                          navigatorTo(context, MainScreen());
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
                                        'خدمة التوصيل المنزلي',
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
                                Container(
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
                                            width: name(size, index),
                                            decoration: BoxDecoration(
                                                color: color(index, context),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                HomeCubit.get(context)
                                                    .name2[index],
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontSize: 14,
                                                  color: color2(index, context),
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
                                        HomeCubit.get(context).name2.length,
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
                              itemCount: HomeCubit.get(context).all2List.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  HomeCubit.get(context).all2List[index],
                                  index),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 1)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).listRestaurants.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  HomeCubit.get(context).listRestaurants[index],
                                  index),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 2)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).listCafes.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  HomeCubit.get(context).listCafes[index],
                                  index),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 3)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).marketList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  HomeCubit.get(context).marketList[index],
                                  index),
                            ),
                          ),
                        if (HomeCubit.get(context).nameIndex == 4)
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.23),
                            child: ListView.builder(
                              itemCount:
                                  HomeCubit.get(context).listDelivery.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildProduct(
                                  context,
                                  size,
                                  HomeCubit.get(context).listDelivery[index],
                                  index),
                            ),
                          ),
                      ],
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
  BuildContext context,
  Size size,
  DeliveryModel serviceModel,
  int index,
) =>
    InkWell(
      onTap: () {
        navigatorTo(context, ChooseMeal());
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            end: size.width * 0.05, start: size.width * 0.05),
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset.fromDirection(
                      1.5,
                      10,
                    ),
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  30,
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  CircleAvatar(
                    radius: size.width * 0.09,
                    backgroundImage: NetworkImage(
                      '${serviceModel.image}',
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${serviceModel.title}',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 16,
                          color: Color(0xff383838),
                          fontWeight: FontWeight.w700,
                          height: size.height * 0.001,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        width: size.width * 0.37,
                        child: Text(
                          serviceModel.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 14,
                            color: Color(0xa8000000),
                            height: size.height * 0.001,
                          ),
                          textHeightBehavior:
                              TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      timenew(index, size,serviceModel),
                    ],
                  ),
                  Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(
                      0xffCBC9D9,
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
      ),
    );

double name(Size size, int index) {
  if (index == 0)
    return size.width * 0.15;
  else if (index > 0 && index < 3)
    return size.width * 0.2;
  else if (index == 3)
    return size.width * 0.24;
  else
    return size.width * 0.27;
}

Widget timenew(int index, Size size,DeliveryModel deliveryModel) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        4,
      ),
      color: Colors.green,
    ),
    height: size.height * 0.032,
    width: size.width * 0.25,
    alignment: AlignmentDirectional.center,
    child: Text(
      deliveryModel.state,
      style: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w100,
        height: size.height * 0.001,
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.right,
      softWrap: false,
    ),
  );
}
