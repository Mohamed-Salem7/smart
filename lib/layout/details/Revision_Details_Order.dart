import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/layout/details/Details_Order.dart';
import 'package:smart_service/modules/Home/cubit/cubit.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';

class RevisionDetails extends StatelessWidget {
  const RevisionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Container(
                  height: size.height * 0.19,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffF6C52F),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        50,
                      ),
                      bottomLeft: Radius.circular(
                        50,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * 0.1,
                        right: size.width * 0.05,
                        child: IconButton(
                          onPressed: () {
                            navigatorFinished(context, const DetailsOrder());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.12,
                        right: size.width * 0.2,
                        child: Text(
                          'مراجعة تفاصيل الطلب',
                          style: TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 20,
                            color: const Color(0xff0f0a39),
                            fontWeight: FontWeight.w700,
                            height: size.height * 0.001,
                          ),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) =>
                                buildOrder(context, size, index),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: size.height * 0.02),
                            shrinkWrap: true,
                            itemCount:HomeCubit.get(context).nameOrder.length,
                          ),
                        ],
                      ),
                    ),
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
                                  'موافق',
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
        },
      ),
    );
  }
}

Widget buildOrder(BuildContext context, Size size, index) => Container(
      height: HomeCubit.get(context).nameOrder.length == 2
          ? size.height * 0.25
          : size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * .015),
            child: Text(
              HomeCubit.get(context).nameOrder[index],
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 21,
                color: const Color(0xff383838),
                fontWeight: FontWeight.w700,
                height: size.height * 0.001,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0025,
                      ),
                      child: Row(
                        children: [
                          if (HomeCubit.get(context).nameOrder.first ==
                              'تفاصيل الطلب :')
                            Text(
                              HomeCubit.get(context).detailsOrder[index],
                              style: const TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color: Color(0xff5300bf),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          const Spacer(),
                          Text(
                            HomeCubit.get(context).detailsAnswerOrder[index],
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 14,
                              color:  Color(0xff7b7890),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // if (HomeCubit.get(context).detailsOrder.)
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                itemCount: HomeCubit.get(context).detailsOrder.length,
                shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
