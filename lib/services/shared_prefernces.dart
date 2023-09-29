import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getStringValuesSF() async {
  final prefs = await SharedPreferences.getInstance();
  //Return String
  String? emailValue = prefs.getString('email');
  // print(emailValue);
  return emailValue;
}

Future<String> getAccesTokenFromShare() async {
  final prefs = await SharedPreferences.getInstance();
  var access = prefs.getString("accessToken") ?? "null";
  // print('получение акцесс токена $access');
  return access;
}
