import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:feroo_store/core/common/widgets/text_app.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/core/style/font/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 600,
      child: CustomLinearButton(
          onPressed: (){

          },
          width: MediaQuery.of(context).size.width,
          child:TextApp
            (text:context.translate(LangKeys.signUp),
              theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontSize.medium
              )
          )
      ),
    );
  }

}