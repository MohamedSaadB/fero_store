
import '../../../../core/app/languages/lang_keys.dart';
import '../../../../core/serves/qraphQL/api/api_result.dart';
import '../data_source/auth_data_source.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/user_role_response.dart';

class AuthRepos {
  const AuthRepos(this._dataSource);
  final AuthDataSource _dataSource;

  //Loign
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body: body);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(LangKeys.loggedError);
    }
  }

  //Get User Role
  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);
    return response;
  }

  //SignUp
  // Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
  //   try {
  //     final response = await _dataSource.signUp(body: body);
  //
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return const ApiResult.failure('Please, try agian we have error');
  //   }
  // }

  // add user id in firebase to used with notfication data base
  // Future<void> addUserIdFirebase({required String userId}) async {
  //   await _dataSource.addUserIdFirebase(userId: userId);
  // }
}
