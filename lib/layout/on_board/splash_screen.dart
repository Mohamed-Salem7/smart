import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_service/layout/Login/login.dart';
import 'package:smart_service/layout/Main_Screen.dart';
import 'package:smart_service/layout/on_board/on_boarding.dart';

import '../../Shared/constant.dart';

class ScreenShot extends StatefulWidget {
  const ScreenShot({Key? key}) : super(key: key);

  @override
  State<ScreenShot> createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShot> {
  @override
  void initState() {
    super.initState();
    loadPage();
  }

  loadPage() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBordingScreen() != null ? (uId != null ? MainScreen() : LoginScreen()) : OnBordingScreen()),
        ModalRoute.withName('/ScreenOne'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width * 0.4,
                  child: const Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/smart.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
