import 'package:http/http.dart' as http;

class LoginApi {
  static Future login(String id, String password) {
    print(id);
    return http.get(
        "https://mobiluygulama.turktelekom.com.tr/sc/Smartcall_ServiceApi/login?id=$id&password=$password");
  }
}
