import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/layout/Login/Register.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/modules/Home/cubit/state.dart';

import '../modules/Home/cubit/cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var homeCubit = HomeCubit.get(context);
          return Scaffold(
            body: homeCubit.screen[homeCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: homeCubit.currentIndex,
              onTap: (value)
              {
                homeCubit.changeScreen(value);
              },
              items: homeCubit.item,
              selectedItemColor: const Color(0xff5300BF),
              unselectedItemColor: const Color(0xff979797),
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                color:  Color(0xff5300BF),
                letterSpacing: 0.256,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 16,
                letterSpacing: 0.256,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
