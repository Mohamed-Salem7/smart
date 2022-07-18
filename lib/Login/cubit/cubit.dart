import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Login/cubit/state.dart';

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
}