import 'dart:io';

import 'package:http/http.dart' as http;

class AllUserApi{
  static Future Alluser(token) {
    print(token);
    return http.get(
        "https://mobiluygulama.turktelekom.com.tr/sc/Smartcall_ServiceApi/allUsers", headers: {HttpHeaders.authorizationHeader:  "Bearer $token"},
    );
  }
}