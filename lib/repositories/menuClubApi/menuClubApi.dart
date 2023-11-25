


import 'dart:convert';

import 'package:http/http.dart';
import 'package:menu_club/repositories/menuClubApi/single_file_api_client.dart';
import 'package:menu_club/repositories/modelClass/SelectTableModel.dart';

import '../modelClass/allCategoriesModel.dart';
import '../modelClass/loginModel.dart';
import '../modelClass/productsModel.dart';
import '../modelClass/selectCustomerModel.dart';
import 'api_client.dart';
import 'multi_file_api_client.dart';

class MenuClubApi {
  ApiClient apiClient = ApiClient();
  SingleFileApiClient singleFileApiClient = SingleFileApiClient();
  MultiFileApiClient multiFileApiClient = MultiFileApiClient();


  Future<LoginModel> getLogin(String email, String password,) async {
    String trendingpath = '/api/loginApp/';
    var body = {
      "email": email,
      "password": password,

    };
    Response response = await apiClient.invokeAPI(
        trendingpath, 'POST', jsonEncode(body));

    return LoginModel.fromJson(jsonDecode(response.body));
  }

  Future<List<SelectTableModel>> getSelectTable() async {
    String trendingpath = '/appApi/TablesApi/';
    var body = {};
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));
    return SelectTableModel.listFromJson(jsonDecode(response.body));
  }

  Future<List<SelectCustomerModel>> getSelectCustomer() async {
    String trendingpath = '/appApi/customerApp/';
    var body = {};
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));
    return SelectCustomerModel.listFromJson(jsonDecode(response.body));
  }

  Future<List<AllCategoriesModel>> getAllCategories() async {
    String trendingpath = '/appApi/category/';
    var body = {};
    Response response = await apiClient.invokeAPI(
        trendingpath, 'GET', jsonEncode(body));
    return AllCategoriesModel.listFromJson(jsonDecode(response.body));
  }

  Future<List<ProductsModel>> getProducts(String id) async {
    String trendingpath = '/appApi/categoryProduct/$id';
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ProductsModel.listFromJson(jsonDecode(response.body));
  }

  createCustomer(
        String name,
        String phone,
        String place,
      )async{
    String trendingpath = '/appApi/customerApp/';
    var body = {
      "Name": name,
      "Phone": phone,
      "Place": place,
      };
    Response response = await multiFileApiClient.uploadFiles(
      uploadPath: trendingpath,
      bodyData: body, files: [], method: 'POST',
    );
  }
}