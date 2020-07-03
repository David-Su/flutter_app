import 'dart:developer';

import 'package:dio/dio.dart';
import 'file:///C:/Users/Administrator/Desktop/flutter_app/lib/model/BaseBean.dart';

class HttpUtil {
  static Dio dio;

  static HttpUtil instance;

  factory HttpUtil.getInstance() {
    if (instance == null) {
      instance = HttpUtil();
    }
    return instance;
  }

  HttpUtil() {
    dio = Dio(BaseOptions(
        baseUrl: "https://www.mxnzp.com/api",
        connectTimeout: 10000,
        receiveTimeout: 10000,
        responseType: ResponseType.json));
  }

  void doGet<T>(String path, {Map params, Function(T data) data, Function(int code) code}) async {
    Response resp = await dio.request(path,
        queryParameters: params,
        options: Options(method: "get", headers: {
          "app_id": "y0udrlrawtpusr1d",
          "app_secret": "NkpSNy8vN1NKejJuWUZmeWR4VEJFZz09"
        }));
    if (handleStateCode(resp.statusCode)) {
      var baseBean = BaseBean.fromJson(resp.data.toString());

      log("baseBean:"+baseBean.toString());

      if (baseBean.code == 1) {
        data?.call(baseBean.data);
      }

      code?.call(baseBean.code);
    }
  }

  bool handleStateCode(int code) {
    switch (code) {
      case 200:
        return true;
      default:
        return false;
    }
  }
}
