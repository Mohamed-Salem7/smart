import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_service/Shared/cache_helper.dart';
import 'package:smart_service/Shared/constant.dart';
import 'package:smart_service/modules/Login/cubit/cubit.dart';
import 'package:smart_service/modules/Login/cubit/state.dart';


class LogoutScreen extends StatelessWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        builder: (context, state) {
          return Scaffold();
        },
        listener: (context, state)
        {
        },
      ),
    );
  }
}
