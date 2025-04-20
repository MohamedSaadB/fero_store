import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:feroo_store/core/common/widgets/text_app.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/core/style/font/font_size.dart';
import 'package:feroo_store/core/toast/show_toast.dart';
import 'package:feroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 600,
      child: BlocConsumer<AuthBloc,AuthState>(
          builder: (context,state){
            return state.maybeWhen(
                loading: ()=>CustomLinearButton(
                    onPressed: (){},
                    width: MediaQuery.of(context).size.width,
                    child:CircularProgressIndicator(color: Colors.white,)
                ),
                orElse: ()=>CustomLinearButton(
                    onPressed: (){
                      context.read<AuthBloc>().add(AuthEvent.login());
                    },
                    width: MediaQuery.of(context).size.width,
                    child:TextApp
                      (text:context.translate(LangKeys.login),
                        theme: context.textStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontSize.medium
                        )
                    )
                ));
          },
          listener: (context,state){
             state.whenOrNull(
               success: (userRole){
                 ShowToast.showToastSuccessTop(message: "welcome again : ");
               },
               error: (errorMessage){
                 ShowToast.showToastSuccessTop(message: "oops!!! please remember the password  : ");

             }
             );
          }));
  }

}