import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> logIn({required String email, required String password}) async {
    try {
      emit(LoginLoading());

      final response = await Dio().post(
        "https://68f7d121f7fb897c661730e1.mockapi.io/api/v1/login",
        data: {"email": email, "password": password},
      );
      emit(LoginSuccess());
      print(response);
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
