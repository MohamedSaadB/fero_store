import 'package:feroo_store/features/auth/presentation/refactors/signup_body.dart';
import 'package:feroo_store/features/auth/presentation/widgets/custom_buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      bottomNavigationBar:CustomButtonNavBar(),
      body: SafeArea(
          bottom: false,
          child: SignupBody()

      ),
    );
  }


}