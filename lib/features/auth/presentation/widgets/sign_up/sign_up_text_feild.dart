import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:feroo_store/core/common/widgets/custom_text_field.dart';
import 'package:feroo_store/core/extension/context_extension.dart';
import 'package:feroo_store/core/utils/app_regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextFeild extends StatefulWidget {
  @override
  State<SignUpTextFeild> createState() => textfeild();
}

class textfeild extends State<SignUpTextFeild> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 600,
            child: CustomTextField(
                controller: TextEditingController(),
                suffixIcon: Icon(Icons.person,
                  color:context.color.textColor ,),
                hintText: context.translate(LangKeys.fullName),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return context.translate(LangKeys.validName);
                  } else
                    return null;
                }),
          ),
          SizedBox(height: 10.h),
          CustomFadeInRight(
            duration: 600,
            child: CustomTextField(
                controller: TextEditingController(),
                suffixIcon: Icon(Icons.email_outlined,
                  color:context.color.textColor ,),
                hintText: context.translate(LangKeys.email),
                validator: (value) {
                  if (AppRegex.isEmailValid(value!)) {
                    return context.translate(LangKeys.validEmail);
                  } else
                    return null;
                }),
          ),
          SizedBox(height: 10.h),
          CustomFadeInLeft(
            duration: 600,
            child: CustomTextField(
                controller: TextEditingController(),
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
                  if (value!.isEmpty || value.length < 7) {
                    return context.translate(LangKeys.validPasswrod);
                  } else
                    return null;
                }),
          )
        ],
      ),
    );
  }
}
