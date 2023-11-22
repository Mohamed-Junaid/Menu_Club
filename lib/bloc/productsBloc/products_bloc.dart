import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:menu_club/repositories/modelClass/productsModel.dart';
import 'package:meta/meta.dart';

import '../../Ui/toast_message.dart';
import '../../repositories/menuClubApi/menuClubApi.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  late List<ProductsModel> productsModel;
  MenuClubApi menuClubApi =MenuClubApi();
  ProductsBloc() : super(ProductsInitial()) {
    on<FetchProducts>((event, emit)async {
      emit(ProductsBlocLoading());
      try{

        productsModel = await menuClubApi.getProducts(event.id)  ;
        emit(ProductsBlocLoaded());
      } catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print(e);
        emit(ProductsBlocError());}
      // TODO: implement event handler
    });
  }
}