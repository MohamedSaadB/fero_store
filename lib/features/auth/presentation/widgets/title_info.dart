import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/text_app.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/core/style/font/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleInfo extends StatelessWidget{

  TitleInfo({required this.title,required this.description});

  final String title ;
  final String description ;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 600,
      child: Column(
          children: [
            TextApp(
                text:title,
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontSize.large
                )),

            SizedBox(height: 10.h,),

            TextApp(
                text:description,
                theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontSize.medium,
                ),
              textAlign: TextAlign.center,
            ),

          ],
      ),
    );
  }


}