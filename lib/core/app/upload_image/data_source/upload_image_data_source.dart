import 'package:dio/dio.dart';
import 'package:feroo_store/core/app/upload_image/models/upload_image_response.dart';
import 'package:feroo_store/core/serves/qraphQL/api/api_service.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageDataSource {
  const UploadImageDataSource(this._api);

  final ApiService _api ;

  Future<UploadImageResponse> uploadImage({required XFile image })async{

    final FormData formData = FormData() ;
    formData.files.add(MapEntry('file', await MultipartFile.fromFile(image.path)));

    final response = await _api.uploadImage(formData);

    return response ;
  }
}