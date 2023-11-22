import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Ui/toast_message.dart';
import '../../repositories/menuClubApi/menuClubApi.dart';
import '../../repositories/modelClass/allCategoriesModel.dart';

part 'all_categories_event.dart';
part 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  late List<AllCategoriesModel> allCategoriesModel;
  MenuClubApi menuClubApi =MenuClubApi();
  AllCategoriesBloc() : super(AllCategoriesInitial()) {
    on<AllCategoriesEvent>((event, emit) async {
      emit(AllCategoriesBlocLoading());
      try{

        allCategoriesModel = await menuClubApi.getAllCategories()  ;
        emit(AllCategoriesBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(AllCategoriesBlocError());}
      // TODO: implement event handler
    });
  }
}