import 'package:bloc/bloc.dart';
import 'package:feroo_store/core/app/upload_image/models/upload_image_response.dart';
import 'package:feroo_store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/image_picker.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this.uploadImageRepo) : super(const UploadImageState.initial());

  final UploadImageRepo uploadImageRepo ;

  late XFile? file ;
  Future<void> uploadImage() async{
    emit(UploadImageState.loading()) ;
    file = (await PickImageUtils().pickImage());
    if(file != null) {
      final response = await uploadImageRepo.uploadImage(imageFile: file!);
      response.when(
          success: (imagePath) {
            print("===image path = $imagePath");
            emit(UploadImageState.uploadSuccess());
          },
          failure: (failure) {
            print("=== $failure");
            emit(UploadImageState.uploadError());
          }
      );
    }
    else {
      emit(UploadImageState.uploadError());
    }
  }
}
