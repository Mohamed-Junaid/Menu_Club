import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:menu_club/repositories/modelClass/selectCustomerModel.dart';
import 'package:meta/meta.dart';

import '../../Ui/toast_message.dart';
import '../../repositories/menuClubApi/menuClubApi.dart';

part 'select_customer_event.dart';
part 'select_customer_state.dart';

class SelectCustomerBloc extends Bloc<SelectCustomerEvent, SelectCustomerState> {
  late List<SelectCustomerModel> selectCustomerModel;
  MenuClubApi menuClubApi =MenuClubApi();
  SelectCustomerBloc() : super(SelectCustomerInitial()) {
    on<SelectCustomerEvent>((event, emit) async {
      emit(SelectCustomerBlocLoading());
      try{

        selectCustomerModel = await menuClubApi.getSelectCustomer()  ;
        emit(SelectCustomerBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(SelectCustomerBlocError());}
      // TODO: implement event handler
    });
  }
}