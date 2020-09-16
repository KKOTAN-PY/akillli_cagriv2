
import 'package:encryptblowfish/encryptblowfish.dart';
import 'package:flutter/services.dart';

class Decrypt{
  String key = 'fXAvxkeB';
  String originStr = 'sdLaKkzNt7Jzmvb';
  String decryptStr = 'fXAvxkeB';
  String _encrypt = 'Unknown';
  String _decrypt = 'Unknown';

  String deger;
  String password ;

  Decrypt();





  Future blowFishEncrypt(String deger)async{
    this.decryptStr = deger;
    await initPlatformState();
    return await _decrypt;

  }

  Future<void> initPlatformState() async {

    String decrypt;
    decrypt = await Encryptblowfish.getStringAfterDecrypt(key, decryptStr);
    this._decrypt = decrypt;


  }
 Future numaraCozucu(String deger)async{

    this.decryptStr = deger;
    await initPlatformState();
    print(_decrypt);
    return await _decrypt;

  }

}