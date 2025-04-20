import 'package:feroo_store/core/app/languages/lang_keys.dart';
import 'package:feroo_store/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:feroo_store/core/app/upload_image/models/upload_image_response.dart';
import 'package:feroo_store/core/serves/qraphQL/api/api_result.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageRepo {

  const UploadImageRepo(this.uploadImageDataSource) ;

  final UploadImageDataSource uploadImageDataSource ;

  Future<ApiResult<UploadImageResponse>> uploadImage({required XFile imageFile})async{

    try{
      final response =await  uploadImageDataSource.uploadImage(image: imageFile);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(LangKeys.imageUploadError);
    }

  }
}