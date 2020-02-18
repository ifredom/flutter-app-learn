import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:io';
// base64库

// http://www.flutterj.com/?post=141

class Util {
/*
  * Base64加密
  */
  static String base64Encode(String data) {
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String base64Decode(String data) {
    List<int> bytes = convert.base64Decode(data);
    // 网上找的很多都是String.fromCharCodes，这个中文会乱码
    //String txt1 = String.fromCharCodes(bytes);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  /*
  * 通过图片路径将图片转换成Base64字符串
  */
  static image2Base64(String path) async {
    File file = new File(path);
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }

  /*
  * 将图片文件转换成Base64字符串
  */
  static imageFile2Base64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }

  /*
  * 将Base64字符串的图片转换成图片
  */
  static base642Image(String base64Txt) async {
    final decodeTxt = convert.base64.decode(base64Txt);
    return Image.memory(
      decodeTxt,
      width: 100, fit: BoxFit.fitWidth,
      gaplessPlayback: true, //防止重绘
    );
  }
}
// testBase64() {
//     String oriTxt =  '[{"name":"小明","mail":"xiaoming@gamil.com","age":89,"money":9999.99}]';
//     String encodeTxt = Util.base64Encode(oriTxt);
//     String decodeTxt = Util.base64Decode(encodeTxt);

//     print(oriTxt);
//     print(encodeTxt);
//     print(decodeTxt);
//   }
