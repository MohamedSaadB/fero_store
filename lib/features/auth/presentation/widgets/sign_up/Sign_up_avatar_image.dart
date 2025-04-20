import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/style/images/app_images.dart';
import 'package:feroo_store/core/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpAvatarImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
       final XFile? xfile =await PickImageUtils().pickImage();
       print("=====>${xfile?.path}") ;
      },
      child: CustomFadeInLeft(
        duration:1200,
        child: CircleAvatar(
          radius:40,
          backgroundImage:AssetImage(AppImages.noNetwork),
        ),
      ),
    );
  }

}