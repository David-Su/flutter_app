import 'dart:convert';

import 'package:flutter_app/generated/json/base/json_convert_content.dart';

class BaseBean<T> {
  int code;
  String msg;
  T data;

  BaseBean(this.code,this.msg,this.data);

  factory BaseBean.fromJson(String jsonStr) {
    Map jsonMap = json.decode(jsonStr);
    return BaseBean(
        jsonMap["code"], jsonMap["msg"], JsonConvert.fromJsonAsT<T>(jsonMap["data"]));
  }
}
