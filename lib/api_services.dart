import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model_class/recipie_detail_data.dart';
import 'model_class/search_recipe_data.dart';


final dio = Dio();
final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
const apiKey = "0049aa2858e24dffa336bc85a54f7d02";

class Failure {
  late Object errorMessage;

  Failure({
    required this.errorMessage,
  });

  Failure.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'][0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = errorMessage;

    return data;
  }
}


void showToast(String message) {
  ScaffoldMessenger.of(snackbarKey.currentContext!).showSnackBar(SnackBar(content: Text(message)));
}

class ApiHelper{
  static const _baseUrl = "https://api.spoonacular.com/";

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 400:
           showToast(response.statusMessage!);
           throw Failure(errorMessage : response.statusMessage.toString());
      case 422:
            showToast(response.statusMessage!);
        throw Failure(errorMessage : response.statusMessage.toString());
      case 403:
           showToast(response.statusMessage!);
        throw Failure(errorMessage : response.statusMessage.toString());
      case 500:
        showToast(response.statusMessage!);
      default:
        throw Failure(errorMessage :
        'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> get(String url) async {
    var apiUrl = _baseUrl + url;
    print(apiUrl);
    dynamic responseJson;
    try {
      final response = await dio.get(apiUrl, options: Options(
        headers: {
          'Content-Type': 'application/json',
         // 'Authorization': 'Bearer $apiKey', // Add your API key here
        },
      ),);
      print(responseJson);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Failure(errorMessage :'No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    var apiUrl = _baseUrl + url ;
    print(apiUrl);
    dynamic responseJson;
    try {
      final response = await dio.post(
        apiUrl,
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          //  'Authorization': 'Bearer $apiKey', // Add your API key here
          },
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Failure(errorMessage :'No Internet connection');
    }

    return responseJson;
  }

}

class ApiServices{
  final  _helper = ApiHelper();


  Future<SearchRecipeData> getSearchData(String query,String? diet ,String? number) async {
    final response = await _helper.get('recipes/complexSearch?query=${query.trim()}&apiKey=$apiKey&diet=${diet?.toLowerCase().trim()}&number=$number');
    return searchRecipeDataJson(response);
  }

  Future<RecipeDetailData> getRecipeDetailData(int id) async {
    final response = await _helper.get('recipes/$id/information?apiKey=$apiKey');
    return recipeDetailDataJson(response);
  }


 /* Future<GetCount> getNewsData(String date) async {
    final response = await _helper.get('get_visit_count/?date=$date');
    return getCountData(response);
  }

  Future <RegisterVisitResponse> register(Map<String, dynamic> body) async{
    final response = await _helper.post('register_visit/', body);
    return registerVisitResponse(response);
  }

  Future <CalculateData> getListOfCrowd(Map<String, dynamic> body) async{
    final response = await _helper.post('calculate/', body);
    return calculateData(response);
  }*/
}