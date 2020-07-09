import 'dart:developer';
import 'package:dio/dio.dart';
import 'model/api.dart';
import 'model/entity/base_bean.dart';

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
        baseUrl: Api.host,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        responseType: ResponseType.plain));
    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) => log(object.toString()),
      )
    ]);
  }

  void doGet<T>(String path,
      {Map<String, dynamic> params,
      Function(T data) data,
      Function(int code) code}) async {
    Response resp = await dio.request(path,
        queryParameters: params,
        options: Options(
            method: "get",
            headers: {"app_id": Api.appId, "app_secret": Api.appSecret}));
    if (handleStateCode(resp.statusCode)) {
//      print(resp.data.toString());

      var baseBean = BaseBean<T>.fromJson(resp.data.toString());

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
