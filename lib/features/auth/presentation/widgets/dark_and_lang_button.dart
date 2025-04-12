import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:feroo_store/core/common/widgets/text_app.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/core/style/font/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkAndLangButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dark mode button
        CustomFadeInRight(
          duration:600,
          child: CustomLinearButton(
              onPressed:(){

              },
              child: Icon(Icons.light_mode_rounded,
              color: Colors.white
                ,)
          ),
        ),
        //language buttton 
        CustomFadeInLeft(
          duration:600,
          child: CustomLinearButton(
              onPressed:(){
          
              },
              height: 44.h,
              width: 100.w,
              child: TextApp(text:context.translate(LangKeys.language),
                  theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight:FontSize.large
                  ))
          ),
        )
      ],
    );
  }


}