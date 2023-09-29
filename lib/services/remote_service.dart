// import 'dart:convert';
// import 'dart:io';
import 'dart:math';

import 'package:allergia/models/allergen_by_cat.dart';
import 'package:allergia/models/allergen_card.dart';
import 'package:allergia/models/card.dart/add_card.dart';
import 'package:allergia/models/login_post.dart';
import 'package:allergia/models/registration_post.dart';
import 'package:allergia/services/shared_prefernces.dart';
import 'package:dio/dio.dart';
import 'package:allergia/models/allergen_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ApiClient {
//   final client = HttpClient();

//   void getAllergens() async {
//     final url = Uri.parse('http://192.168.0.242:8000/api/v1/allergens/');
//     final request = await client.getUrl(url);
//     final response = await request.close();
//     final jsonStrings = await response.transform(utf8.decoder).toList();
//     final jsonString = jsonStrings.join();

//     // print(jsonString);
//   }
// }
// addStringToSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? accessToken = prefs.getString('accessToken');
//   return accessToken;
// }

class DioClient {
  final Dio _dio = Dio();
  // final _allergensUrl = 'http://192.168.88.251:8000/api';
  final _allergensUrl = 'http://allergydiary.ru/api';
  late final _categoryUrl = _allergensUrl + '/category';
  late final _registerUrl = _allergensUrl + '/register/';
  late final _authorizationUrl = _allergensUrl + '/token/';
  late final _tokenrefreshUrl = _allergensUrl + '/token/refresh/';
  // final _allergensUrl = 'http://192.168.0.242:8000/';
  // final _categoryUrl = 'http://192.168.0.242:8000/category';
  // final _registerUrl = 'http://192.168.0.242:8000/register/';
  // final _authorizationUrl = 'http://192.168.0.242:8000/api/token/';
  // final _tokenrefreshUrl = 'http://192.168.0.242:8000/api/token/refresh/';
  Future<List<AllergenPost?>?> getAllergens() async {
    var _AccessToken = await getAccesTokenFromShare();
    List<AllergenPost?>? allergenpost;
    try {
      Response allergenData = await _dio.get(_allergensUrl,
          options: Options(
            headers: {"Authorization": "Bearer $_AccessToken"},
          ));
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      // print(allergenData.data);
      allergenpost = (allergenData.data as List)
          .map((x) => AllergenPost?.fromJson(x))
          .toList();
      return allergenpost;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
      }
    }
  }

  Future<dynamic> addNewCard(
      {required String CardName, required int id}) async {
    var _AccessToken = await getAccesTokenFromShare();
    try {
      Response addAllergenCardData = await _dio.post(
        '$_allergensUrl/',
        options: Options(
          headers: {"Authorization": "Bearer $_AccessToken"},
        ),
        data: {
          'name': CardName,
          'carriers_id': [id],
        },
      );
      // print('response:');
      // print(addAllergenCardData.statusMessage);
      return addAllergenCardData.statusMessage;
    } catch (e) {
      // print('Error deleting user: $e');
      rethrow;
    }
  }

  // Future<AddAllergenCard?> addNewCard(
  //     {required String CardName, required int id}) async {
  //   var _AccessToken = await getAccesTokenFromShare();
  //   AddAllergenCard? addAllergenCardPost;
  //   try {
  //     Response addAllergenCardData = await _dio.post(
  //       _allergensUrl,
  //       options: Options(
  //         headers: {"Authorization": "Bearer $_AccessToken"},
  //       ),
  //       data: {
  //         'name': CardName,
  //         'carriers_id': [id],
  //       },
  //     );
  //     // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
  //     // print('response');
  //     // print(addAllergenCardData.data);
  //     addAllergenCardPost = AddAllergenCard.fromJson(addAllergenCardData.data);
  //     // print(addAllergenCardPost);
  //     return addAllergenCardPost;
  //   } catch (e) {
  //     if (e is DioError) {
  //       //handle DioError here by error type or by error code
  //       // print('Dio error!');
  //       // print('STATUS: ${e.response?.statusCode}');
  //       // print(e.response!.data['password2']);
  //       // print('DATA: ${e.response?.data}');
  //       // print('HEADERS: ${e.response?.headers}');
  //       addAllergenCardPost = AddAllergenCard.fromJson(e.response!.data);
  //       return addAllergenCardPost;
  //     } else {
  //       // Error due to setting up or sending the request
  //       // print('Error sending request!');
  //       // print(e);
  //       rethrow;
  //     }
  //     //return empty list (you can also return custom error to be handled by Future Builder)
  //     // } on DioError catch (e) {
  //     //   // print(e.response!.data);
  //     //   authResponsePost = AuthResponse.fromJson(e.response!.data);
  //     //   return authResponsePost;
  //     // }
  //   }
  // }

  Future<AllergenCard?> getAllergenCard(int pk) async {
    var _AccessToken = await getAccesTokenFromShare();
    AllergenCard? allergenCard;
    try {
      Response allergenCardData = await _dio.get('$_allergensUrl/$pk/',
          options: Options(
            headers: {"Authorization": "Bearer $_AccessToken"},
          ));
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      // print(allergenCardData.data);
      allergenCard = AllergenCard.fromJson(allergenCardData.data);
      return allergenCard;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
      }
    }
  }

  Future<dynamic> deleteCard({required int pk}) async {
    var _AccessToken = await getAccesTokenFromShare();
    try {
      Response cardDeleteData = await _dio.delete('$_allergensUrl/$pk/',
          options: Options(
            headers: {"Authorization": "Bearer $_AccessToken"},
          ));
      // print('deletereq');
      // print(cardDeleteData.statusCode);
      return cardDeleteData.statusCode;
    } catch (e) {
      // print('Error deleting user: $e');
      rethrow;
    }
  }

  Future<List<AllergenByCat?>?> getAllergensByCat({required int id}) async {
    var _AccessToken = await getAccesTokenFromShare();
    List<AllergenByCat?>? allergenbycatpost;
    try {
      Response allergenByCatData = await _dio.get('$_categoryUrl/$id/',
          options: Options(
            headers: {"Authorization": "Bearer $_AccessToken"},
          ));
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      // print(allergenByCatData.data);
      allergenbycatpost = (allergenByCatData.data as List)
          .map((x) => AllergenByCat?.fromJson(x))
          .toList();
      return allergenbycatpost;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);
      }
    }
  }

  Future<dynamic> getCategoryItems() async {
    var _AccessToken = await getAccesTokenFromShare();
    try {
      Response getCardCateItems = await _dio.get(_categoryUrl,
          options: Options(
            headers: {"Authorization": "Bearer $_AccessToken"},
          ));
      // // print(getCardCateItems.data);
      return getCardCateItems.data;
    } catch (e) {
      // print('Error deleting user: $e');
    }
  }

  Future<AuthResponse?> login(String email, String password) async {
    AuthResponse? authResponsePost;
    try {
      Response authData = await _dio.post(
        _authorizationUrl,
        data: {
          'email': email,
          'password': password,
        },
      );
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      // print(authData.data);
      authResponsePost = AuthResponse.fromJson(authData.data);
      // print(authResponsePost);
      return authResponsePost;
    } catch (e) {
      if (e is DioError) {
        //handle DioError here by error type or by error code
        // // print('Dio error!');
        // // print('STATUS: ${e.response?.statusCode}');
        // // print(e.response!.data['password2']);
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
        authResponsePost = AuthResponse.fromJson(e.response!.data);
        return authResponsePost;
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e);
        rethrow;
      }
      //return empty list (you can also return custom error to be handled by Future Builder)
      // } on DioError catch (e) {
      //   // print(e.response!.data);
      //   authResponsePost = AuthResponse.fromJson(e.response!.data);
      //   return authResponsePost;
      // }
    }
  }

  Future<RegistrationResponse?> register(
      {required Map<String, dynamic> userData}) async {
    RegistrationResponse? registrationPost;

    try {
      Response registerData = await _dio.post(
        _registerUrl,
        data: userData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      // print(registerData.data);

      if (registerData.statusCode == 200) {
        // print(registerData.statusCode);

        registrationPost = RegistrationResponse.fromJson(registerData.data);
        // print(registrationPost);
        return registrationPost;
      } else if (registerData.statusCode == 400) {
        // print(registerData.data);
        // print('писюн');
      }
    } catch (e) {
      if (e is DioError) {
        //handle DioError here by error type or by error code
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print(e.response!.data['password2']);
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e);
        rethrow;
      }
      //return empty list (you can also return custom error to be handled by Future Builder)
    }

    // on DioError catch (e) {
    //   // The request was made and the server responded with a status code
    //   // that falls out of the range of 2xx and is also not 304.
    //   if (e.response != null) {
    //     // print('Dio error!');
    //     // print('STATUS: ${e.response?.statusCode}');
    //     // print(e.response!.data['password2']);
    //     // print('DATA: ${e.response?.data}');
    //     // print('HEADERS: ${e.response?.headers}');
    //     return e.response!.data['password2'];
    //   } else {
    //     // Error due to setting up or sending the request
    //     // print('Error sending request!');
    //     // print(e.message);
    //     rethrow;
    //   }
  }

  // {email: [Это поле не может быть пустым.], username: [Это поле не может быть пустым.], password: [Это поле не может быть пустым.], password2: [Это поле не может быть пустым.]}
}
