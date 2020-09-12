
import 'package:encryptblowfish/encryptblowfish.dart';
import 'package:flutter/services.dart';

class Encrypt{
  String key = 'fXAvxkeB';
  String originStr = 'sdLaKkzNt7Jzmvb';//todo chuỗi gốc , đang chưa mã hóa
  String decryptStr = 'fXAvxkeB';//todo chuỗi đã được mã hóa , cần được giải hóa
  String _encrypt = 'Unknown';
  String _decrypt = 'Unknown';

  String deger;
  String password ;

  Encrypt();





  Future blowFishEncrypt(String deger)async{
    this.originStr = deger;
    await initPlatformState();
    return await _encrypt;

  }

  Future<void> initPlatformState() async {
    String encrypt;
    String decrypt;
    // Platform messages may fail, so we use a try/catch PlatformException.
    encrypt = await Encryptblowfish.getStringAfterEncrypt(key, originStr);
    //decrypt = await Encryptblowfish.getStringAfterDecrypt(key, decryptStr);
    this._encrypt = encrypt;
    this._decrypt = decrypt;

  }

}