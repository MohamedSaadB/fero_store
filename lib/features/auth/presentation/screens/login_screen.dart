import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/features/auth/presentation/refactors/auth_custom_painter.dart';
import 'package:feroo_store/features/auth/presentation/refactors/login_body.dart';
import 'package:feroo_store/features/auth/presentation/widgets/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LogIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CustomButtonNavBar(),
      body: SafeArea(
         bottom: false,
          child: LogInBody()),
    );
  }
  
  
}