import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Ui/toast_message.dart';
import '../../repositories/menuClubApi/menuClubApi.dart';
import '../../repositories/modelClass/loginModel.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModel loginModel;
  MenuClubApi menuClubApi =MenuClubApi();
  LoginBloc() : super(LoginInitial()) {
    on<FetchLogin>((event, emit)async {
      emit(LoginBlocLoading());
      try{

        loginModel = await menuClubApi.getLogin(event.email,event.password)  ;
        emit(LoginBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:"Invalid Email or Password");
      print(e);
      emit(LoginBlocError());}
      // TODO: implement event handler
    });
  }
}
