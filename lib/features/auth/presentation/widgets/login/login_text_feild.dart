import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:feroo_store/core/common/widgets/custom_text_field.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/core/utils/app_regex.dart';
import 'package:feroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextFeild extends StatefulWidget {
  @override
  State<LoginTextFeild> createState() => textfeild();
}

class textfeild extends State<LoginTextFeild> {
  bool isSecure = true;
  late AuthBloc _authBloc ;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authBloc.formKey,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 600,
            child: CustomTextField(
                controller: _authBloc.emailController,
                suffixIcon: Icon(Icons.email_outlined,
                  color:context.color.textColor ,),
                hintText: context.translate(LangKeys.email),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return context.translate(LangKeys.emptyField); ;
                  }
                  // else if (AppRegex.isEmailValid(value)) {
                  //   return context.translate(LangKeys.validEmail);
                  // }
                  else
                    return null;
                }
                ),
          ),
          SizedBox(height: 10.h),
          CustomFadeInLeft(
            duration: 600,
            child: CustomTextField(
                controller: _authBloc.passwordController,
                obscureText: isSecure,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                    icon: Icon(isSecure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                        color:context.color.textColor )),
                hintText: context.translate(LangKeys.password),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return context.translate(LangKeys.emptyField); ;
                  }
                  // if (value!.isEmpty || value.length < 7) {
                  //   return context.translate(LangKeys.validPasswrod);
                  // }
                  else
                    return null;
                }),
          )
        ],
      ),
    );
  }
}
