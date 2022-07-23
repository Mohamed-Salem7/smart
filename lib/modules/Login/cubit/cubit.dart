import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';

class LoginCubit extends Cubit<LoginState>
{
  LoginCubit() : super (InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isResend = false;
  bool isVerified = false;
  bool isLoading = false;

  late Timer timer;
  int start = 30;
  void resend()
  {
    isResend = true;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer)
        {
          if(start == 0)
          {
            start = 30;
            isResend = false;
            timer.cancel();
          }else
            {
              start--;
            }
        });
  }

  void verifyingNumber({
    required String phoneNumber,
  }) async {
    emit(LoadingLoginState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential)
      async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e)
      {
        if(e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        // Sign the user in (or link) with the credential
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 30),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    ).then((value) {
      emit(SuccessLoginState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorLoginState(error));
    });
  }
}