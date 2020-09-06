
import 'package:http/http.dart' as http;

class VerificationApi{



  static Future Verification(String id,String verificationCode ){
    print(verificationCode);
    print(id);
    return http.get(
        "https://mobiluygulama.turktelekom.com.tr/sc/Smartcall_ServiceApi/verificationLogin?id=$id&verificationCode=$verificationCode");

}


}