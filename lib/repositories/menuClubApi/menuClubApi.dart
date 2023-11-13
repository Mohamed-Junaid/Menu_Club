


import 'dart:convert';

import 'package:http/http.dart';
import 'package:menu_club/repositories/menuClubApi/single_file_api_client.dart';

import '../modelClass/loginModel.dart';
import 'api_client.dart';
import 'multi_file_api_client.dart';

class MenuClubApi{
  ApiClient apiClient = ApiClient();
  SingleFileApiClient singleFileApiClient=SingleFileApiClient();
  MultiFileApiClient multiFileApiClient=MultiFileApiClient();


  Future<LoginModel> getLogin(String email,String password,) async {
    String trendingpath = '/api/loginApp/';
    var body = {
      "email":email,
      "password":password,

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return LoginModel.fromJson(jsonDecode(response.body));
  }
}
