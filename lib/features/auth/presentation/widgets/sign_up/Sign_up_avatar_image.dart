import 'package:feroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:feroo_store/core/common/animations/animate_do.dart';
import 'package:feroo_store/core/style/images/app_images.dart';
import 'package:feroo_store/core/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpAvatarImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit,UploadImageState>
      (builder: (context,state){
        final cubit = context.read<UploadImageCubit>();
        return state.when(
            initial:()=>InkWell(
              onTap: (){
                cubit.uploadImage();
              },
              child: CustomFadeInLeft(
                duration:1200,
                child: CircleAvatar(
                  radius:40,
                  backgroundImage:AssetImage(AppImages.noNetwork),
                ),
              ),
            ),
            loading:()=>CustomFadeInLeft(
              duration:1200,
              child: CircularProgressIndicator()
            ),
            uploadSuccess:()=>CustomFadeInLeft(
                duration:1200,
                child: Icon(Icons.add_circle)
            ),
            uploadError: ()=>CustomFadeInLeft(
                duration:1200,
                child: Icon(Icons.error)
            ),);
    });
  }

}