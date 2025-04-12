import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/features/auth/presentation/refactors/auth_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size:Size(MediaQuery.of(context).size.width, 150.h),
      painter: AuthCustomPainter(
          gradient: LinearGradient(
              colors: [
                context.color.bluePinkLight!,
                context.color.bluePinkLight!,
                context.color.bluePinkLight!,
                context.color.bluePinkLight!,
              ]
          )
      ),

    );
  }


}