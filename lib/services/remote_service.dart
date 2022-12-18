// import 'dart:convert';
// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:allergiav2/models/allergen_post.dart';

// class ApiClient {
//   final client = HttpClient();

//   void getAllergens() async {
//     final url = Uri.parse('http://192.168.0.242:8000/api/v1/allergens/');
//     final request = await client.getUrl(url);
//     final response = await request.close();
//     final jsonStrings = await response.transform(utf8.decoder).toList();
//     final jsonString = jsonStrings.join();

//     print(jsonString);
//   }
// }
class DioClient {
  final Dio _dio = Dio();
  final _allergensUrl = 'http://192.168.0.242:8000';
  final _categoryUrl = 'http://192.168.0.242:8000/category/';
  final _registerUrl = 'http://192.168.0.242:8000/register/';
  final _authorizationUrl = 'http://192.168.0.242:8000/api/token/';
  final _tokenrefreshUrl = 'http://192.168.0.242:8000/api/token/refresh/';

  Future<List<AllergenPost>?> getAllergens() async {
    List<AllergenPost> allergenpost;
    try {
      Response allergenData = await _dio.get(_allergensUrl,
          options: Options(
            headers: {
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjczMTY0NjA4LCJqdGkiOiJiZTYzZDdjNGQ0MzU0OGQ2OTRmYTBlYTQxNWVkNGE4YiIsInVzZXJfaWQiOjF9.QvWiNMpw4VisqdS7cSjndP0YKFc-EeU_uf10sSHFaYM"
            },
          ));
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      print(allergenData.data);
      allergenpost = (allergenData.data as List)
          .map((x) => AllergenPost.fromJson(x))
          .toList();
      return allergenpost;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  //   Future<Response> getCategory() async {
  //   // AllergenPost? allergenpost;

  //   try {
  //     Response allergenData = await _dio.get(_categoryUrl,
  //         options: Options(
  //           headers: {
  //             "Authorization":
  //                 "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMTQyMDU2LCJqdGkiOiI1MGQ5YjhkZjE2MGQ0MDMwYTUyNDI1MzU1NzVjNjgyNyIsInVzZXJfaWQiOjF9.KuKcryd59RM0Vf5L7HGOnGsOBi1OxEhaWANzVtn0Ep4"
  //           },
  //         ));

  //     print('User Info: ${allergenData}');

  //     // allergenpost = AllergenPost.fromJson(allergenData.data);
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   print(allergenData.);
  //   return allergenData;
  // }

  //   Future<AllergenPost?> getAllergens() async {
  //   AllergenPost? allergenpost;

  //   try {
  //     Response allergenData = await _dio.get(_allergensUrl,
  //         options: Options(
  //           headers: {
  //             "Authorization":
  //                 "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMTQyMDU2LCJqdGkiOiI1MGQ5YjhkZjE2MGQ0MDMwYTUyNDI1MzU1NzVjNjgyNyIsInVzZXJfaWQiOjF9.KuKcryd59RM0Vf5L7HGOnGsOBi1OxEhaWANzVtn0Ep4"
  //           },
  //         ));

  //     print('User Info: ${allergenData}');

  //     allergenpost = AllergenPost.fromJson(allergenData.data);
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   print(allergenpost);
  //   return allergenpost;
  // }

  //   Future<AllergenPost?> getAllergens() async {
  //   AllergenPost? allergenpost;

  //   try {
  //     Response allergenData = await _dio.get(_allergensUrl,
  //         options: Options(
  //           headers: {
  //             "Authorization":
  //                 "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMTQyMDU2LCJqdGkiOiI1MGQ5YjhkZjE2MGQ0MDMwYTUyNDI1MzU1NzVjNjgyNyIsInVzZXJfaWQiOjF9.KuKcryd59RM0Vf5L7HGOnGsOBi1OxEhaWANzVtn0Ep4"
  //           },
  //         ));

  //     print('User Info: ${allergenData}');

  //     allergenpost = AllergenPost.fromJson(allergenData.data);
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   print(allergenpost);
  //   return allergenpost;
  // }

  //   Future<AllergenPost?> getAllergens() async {
  //   AllergenPost? allergenpost;

  //   try {
  //     Response allergenData = await _dio.get(_allergensUrl,
  //         options: Options(
  //           headers: {
  //             "Authorization":
  //                 "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcxMTQyMDU2LCJqdGkiOiI1MGQ5YjhkZjE2MGQ0MDMwYTUyNDI1MzU1NzVjNjgyNyIsInVzZXJfaWQiOjF9.KuKcryd59RM0Vf5L7HGOnGsOBi1OxEhaWANzVtn0Ep4"
  //           },
  //         ));

  //     print('User Info: ${allergenData}');

  //     allergenpost = AllergenPost.fromJson(allergenData.data);
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   print(allergenpost);
  //   return allergenpost;
  // }
}
