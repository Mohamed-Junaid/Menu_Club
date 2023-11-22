import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:menu_club/repositories/modelClass/SelectTableModel.dart';
import 'package:meta/meta.dart';

import '../../Ui/toast_message.dart';
import '../../repositories/menuClubApi/menuClubApi.dart';

part 'select_table_event.dart';
part 'select_table_state.dart';

class SelectTableBloc extends Bloc<SelectTableEvent, SelectTableState> {
  late List<SelectTableModel> selectTableModel;
  MenuClubApi menuClubApi =MenuClubApi();
  SelectTableBloc() : super(SelectTableInitial()) {
    on<SelectTableEvent>((event, emit) async {
      emit(SelectTableBlocLoading());
      try{

        selectTableModel = await menuClubApi.getSelectTable()  ;
        emit(SelectTableBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
      print(e);
      emit(SelectTableBlocError());}
      // TODO: implement event handler
    });
  }
}