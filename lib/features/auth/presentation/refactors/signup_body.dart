import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/text_app.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/features/auth/presentation/widgets/dark_and_lang_button.dart';
import 'package:feroo_store/features/auth/presentation/widgets/sign_up/Sign_up_avatar_image.dart';
import 'package:feroo_store/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:feroo_store/features/auth/presentation/widgets/sign_up/sign_up_text_feild.dart';
import 'package:feroo_store/features/auth/presentation/widgets/title_info.dart';
import 'package:feroo_store/routes/app_route.dart';
import 'package:feroo_store/core/style/font/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
        child:SingleChildScrollView(
          child: Column(
            children: [
              DarkAndLangButton(),
              SizedBox(height: 50.h,),
              TitleInfo(
                title: context.translate(LangKeys.signUp),
                description: context.translate(LangKeys.signUpWelcome),
              ),
              SizedBox(height:15.h,),

              SignUpAvatarImage(),

              SizedBox(height: 10.h,),

              SignUpTextFeild(),

              SizedBox(height: 10.h,),

              SignUpButton(),

              SizedBox(height: 10.h,),

              CustomFadeInUp(
                duration: 600,
                child: TextButton(
                  onPressed: (){
                    context.pushReplacementNamed(AppRoute.login);
                  },
                  child: TextApp(
                      text:context.translate(LangKeys.youHaveAccount),
                      theme: context.textStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontSize.medium,
                          color: context.color.bluePinkLight
                      )),
                ),
              )




            ],
          ),
        )
    );
  }

}