// /*
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:select_form_field/select_form_field.dart';
// import 'package:smart_service/Shared/constant.dart';
// import 'package:smart_service/layout/Main_Screen.dart';
// import 'package:smart_service/layout/Setting/Settings_Screen.dart';
// import 'package:smart_service/modules/Home/cubit/cubit.dart';
// import 'package:smart_service/modules/Home/cubit/state.dart';
//
// class LanguageScreen extends StatelessWidget {
//   const LanguageScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => HomeCubit(),
//         child: BlocConsumer<HomeCubit, HomeState>(
//           builder: (context, state) {
//             var size = MediaQuery.of(context).size;
//             var homeCubit = HomeCubit.get(context);
//             return Scaffold(
//               body: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height * 0.3,
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: size.height * 0.22,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(30,),bottomLeft: Radius.circular(30,),),
//                             color: Color(0xffF6C52F),
//                           ),
//                         ),
//                         Positioned(
//                           top: size.height * 0.1,
//                           right: size.width * 0.15,
//                           child: Text(
//                             'إختار اللغة',
//                             style: TextStyle(
//                               fontFamily: 'Tajawal',
//                               fontSize: 18,
//                               color: const Color(0xff5300bf),
//                               fontWeight: FontWeight.w700,
//                               height: size.height * 0.0015,
//                             ),
//                             textAlign: TextAlign.end,
//                           ),
//                         ),
//                         Positioned(
//                           top: size.height * 0.083,
//                           right: size.width * 0.05,
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.arrow_back_ios,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.02),
//                     child: Column(
//                       children: [
//                         SelectFormField(
//                           type : SelectFormFieldType.dropdown,
//                           items: homeCubit.items,
//                           initialValue: 'العربية',
//                           icon: Icon(Icons.language),
//                           style: TextStyle(
//                             fontFamily: 'Tajawal',
//                             fontSize: 18,
//                             //color: const Color(0xff5300bf),
//                             fontWeight: FontWeight.w700,
//                             height: size.height * 0.0015,
//                           ),
//                           labelText: 'اللغة',
//                           onSaved: (val) => print(val),
//                           onChanged: (vale) => print(vale),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     height: size.height * 0.1,
//                     width: double.infinity,
//                     color: Color(0xffFFFFFF),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: size.width * 0.0525,
//                           vertical: size.height * 0.02),
//                       child: Column(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               navigatorFinished(context, const MainScreen());
//                             },
//                             child: Align(
//                               alignment: AlignmentDirectional.centerEnd,
//                               child: Container(
//                                 height: size.height * 0.05,
//                                 width: size.width * 0.3,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                     20,
//                                   ),
//                                   color: const Color(0xff5300BF),
//                                 ),
//                                 child: const Center(
//                                   child: Text(
//                                     'موافق',
//                                     style: TextStyle(
//                                       fontFamily: 'Tajawal',
//                                       fontSize: 14,
//                                       color: Color(0xffffffff),
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                     softWrap: false,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           listener: (context, state) {},
//         ));
//   }
// }
// */
