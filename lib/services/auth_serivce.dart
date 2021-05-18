import 'package:http/http.dart' as http;
import 'dart:convert';

// 'email': 'vietnguyenhoangwww@gmail.com',
// 'password': '123123123'

class Api {
  Future<String> LoginAPI(
      {Function(String) onError, String username, String password}) async {
    String endpoint = 'http://192.168.1.41:3003/auth/login';
    http.Response response = await http.post(Uri.parse(endpoint),
        body: {'email': username.toString(), 'password': password.toString()});
    dynamic jsonRawData = json.decode(response.body);
    bool isError = jsonRawData["isError"];
    String errorMessage = jsonRawData["errorMessage"];
    int statusCode = jsonRawData["statusCode"];
    if (response.statusCode == 200) {
      try {
        if (statusCode == 200) {
          if (!isError) {
            return "login_success";
          } else {
            return errorMessage;
          }
        }
      } catch (e) {
        return ("Something get wrong! / $e");
      }
    } else {
      return ("Something get wrong! Status code ${response.statusCode}");
    }
  }
}
