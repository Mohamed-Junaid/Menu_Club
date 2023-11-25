import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Ui/toast_message.dart';
import '../../repositories/menuClubApi/menuClubApi.dart';

part 'create_customer_event.dart';
part 'create_customer_state.dart';

class CreateCustomerBloc extends Bloc<CreateCustomerEvent, CreateCustomerState> {
  MenuClubApi menuClubApi =MenuClubApi();
  CreateCustomerBloc() : super(CreateCustomerInitial()) {
    on<FetchCreateCustomer>((event, emit) async {
      emit(CreateCustomerBlocLoading());
      try{
        await menuClubApi.createCustomer(event.name,event.phone,event.place)  ;
        emit(CreateCustomerBlocLoaded());
      } catch(e){ ToastMessage().toastmessage(message:e.toString());
      print(e);
      emit(CreateCustomerBlocError());}
      // TODO: implement event handler
    });
  }

}
