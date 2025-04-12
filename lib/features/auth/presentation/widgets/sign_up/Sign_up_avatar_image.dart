import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

class SignUpAvatarImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomFadeInLeft(
      duration:1200,
      child: CircleAvatar(
        radius:40,
        backgroundImage:AssetImage(AppImages.noNetwork),
      ),
    );
  }

}