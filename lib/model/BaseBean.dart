import 'dart:convert';

class BaseBean<T> {
  int code;
  String msg;
  T data;

  BaseBean(int code, String msg, T data);

  factory BaseBean.fromJson(String jsonStr) {
    var map = json.decode(jsonStr);
    return BaseBean(map["code"], map["msg"], map["data"] as T);
  }
}
