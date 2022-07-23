import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/layout/details/Details_Service.dart';
import 'package:smart_service/layout/details/Revision_Details_Order.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
import 'package:unicons/unicons.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var detailsServiceController = TextEditingController();
    var dayService = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.22,
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
                      navigatorFinished(context, const DetailsService());
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
                    'تفاصيل الطلب',
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.05, horizontal: size.width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إضافة تفاصيل الخدمة',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        color: const Color(0xff383838),
                        fontWeight: FontWeight.w700,
                        height: size.height * 0.001,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'تفاصيل الخدمة',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        color: Color(0xff7b7890),
                        height: size.height * 0.001,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.895,
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F6FA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.01),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null) {
                              return 'رجاءا أدخل تفاصيل خدمتك';
                            }
                            return null;
                          },
                          maxLines: 5,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontFamily: 'Tajawal',
                            fontSize: 16,
                            color: Color(0xff0f0a39),
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' أدخل تفاصيل الخدمة الخاصة بك',
                            hintStyle: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: Color(0xffcbc9d9),
                              height: size.height * 0.001,
                            ),
                          ),
                          onTap: () {},
                          controller: detailsServiceController,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'حدد اليوم المناسب لتلقي الخدمة',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        color: const Color(0xff383838),
                        fontWeight: FontWeight.w700,
                        height: size.height * 0.001,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'يوم الخدمة',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        color: const Color(0xff7b7890),
                        height: size.height * 0.001,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: TextFormField(
                          controller: dayService,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'أدخل اليوم المناسب',
                            hintStyle: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xffcbc9d9),
                              height: size.height * 0.001,
                            ),
                            suffixIcon: Icon(UniconsLine.calendar_alt),
                            suffixIconColor:  Color(0xff5300BF),
                            border: InputBorder.none,
                            fillColor: Colors.green.shade50,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'حدد الوقت المناسب لتلقي الخدمة',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 16,
                        color: const Color(0xff383838),
                        fontWeight: FontWeight.w700,
                        height: size.height * 0.001,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'وقت الخدمة',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: 14,
                        color: const Color(0xff7b7890),
                        height: size.height * 0.001,
                      ),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffF5F6FA),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: TextFormField(
                          controller: dayService,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'أدخل الوقت المناسب',
                            hintStyle: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              color: const Color(0xffcbc9d9),
                              height: size.height * 0.001,
                            ),
                            suffixIcon: Icon(Icons.access_time_rounded),
                            suffixIconColor:  Color(0xff5300BF),
                            border: InputBorder.none,
                            fillColor: Colors.green.shade50,
                          ),
                        ),
                      ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          navigatorTo(context, const DetailsService());
                        },
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
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
                          child: const Center(
                            child: Text(
                              'رجوع',
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 14,
                                color:  Color(0xff5300bf),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      InkWell(
                        onTap: ()
                        {
                          navigatorTo(context, const RevisionDetails());
                        },
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
