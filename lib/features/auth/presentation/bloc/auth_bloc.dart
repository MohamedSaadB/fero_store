import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:feroo_store/features/auth/data/models/login_request_body.dart';
import 'package:feroo_store/features/auth/data/reposatories/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/serves/shared_pref/pref_key.dart';
import '../../../../core/serves/shared_pref/shared_pref.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepos) : super(const AuthState.initial()){
    on<_LoginEvent>(_login);
  }

  final AuthRepos _authRepos ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  FutureOr<void> _login(_LoginEvent event, Emitter<AuthState> emit) async {
    if(formKey.currentState!.validate()) {
      emit(const AuthState.loading());

      final result = await _authRepos.login(LoginRequestBody(
          email: emailController.text,
          password: passwordController.text));

      await result.when(
          success: (loginData) async {
            // user token
            final token = loginData.data.login.accessToken ?? '';
            // save token in shared preferences
            await SharedPref().setString(PrefKey.accessToken, token);
            // get user role
            final user = await _authRepos.userRole(token);
            await SharedPref().setInt(PrefKey.userId, user.userId ?? 0);
            await SharedPref().setString(PrefKey.userRole, user.userRole ?? '');
            print("----------user role${user.userRole}");
            // await _authRepos.addUserIdFirebase(userId: user.userId.toString());
            emit(AuthState.success(userRole: user.userRole.toString()));
          },
          failure: (error) {
            emit(AuthState.error(message: error));
          });
    }
  }
}
