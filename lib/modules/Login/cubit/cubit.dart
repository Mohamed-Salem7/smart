import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/models/Register_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isResend = false;
  bool isVerified = false;
  bool isLoading = false;

  late Timer timer;
  int start = 30;

  void resend() {
    isResend = true;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        start = 30;
        isResend = false;
        timer.cancel();
      } else {
        start--;
      }
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changeVisibilityPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeVisibilityPassword());
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginUserState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(SuccessLoginUserState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginUserState(error));
    });
  }

  void createAccount({
    required String email,
    required String name,
    required String uId,
  }) {
    RegisterModel registerModel = RegisterModel(
      name: name,
      email: email,
      uId: uId,
      image:
          'https://www.dotcominfoway.com/wp-content/uploads/2020/01/social-media-app-cost.png',
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(registerModel.toMap())
        .then((value) {
      emit(SuccessRegisterClient());
    }).catchError((error) {
      emit(ErrorRegisterClient(error));
    });
  }

  void registerClient({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(LoadingRegisterClient());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createAccount(
        email: email,
        name: name,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterClient(error));
    });
  }

// void verifyingNumber({
//   required String phoneNumber,
// }) async {
//   emit(LoadingLoginState());
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     verificationCompleted: (PhoneAuthCredential credential)
//     async {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     },
//     verificationFailed: (FirebaseAuthException e)
//     {
//       if(e.code == 'invalid-phone-number') {
//         print('The provided phone number is not valid.');
//       }
//     },
//     codeSent: (String verificationId, int? resendToken) async {
//       // Update the UI - wait for the user to enter the SMS code
//       String smsCode = 'xxxx';
//       // Create a PhoneAuthCredential with the code
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
//       // Sign the user in (or link) with the credential
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     },
//     timeout: const Duration(seconds: 30),
//     codeAutoRetrievalTimeout: (String verificationId) {
//       // Auto-resolution timed out...
//     },
//   ).then((value) {
//     emit(SuccessLoginState());
//   }).catchError((error){
//     print(error.toString());
//     emit(ErrorLoginState(error));
//   });
// }
}
