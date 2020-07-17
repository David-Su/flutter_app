import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter_app/http_util.dart';
import 'package:flutter_app/model/api.dart';
import 'package:flutter_app/model/entity/weather_entity.dart';
import 'package:flutter_app/util/permission_util.dart';
import 'package:permission_handler/permission_handler.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherPageState();
}

class _WeatherPageState extends State {
  WeatherEntity _weatherEntity;

  @override
  void initState() {
    super.initState();
    PermissionUtil.requestPermission(Permission.location).then((value) {
      switch (value) {
        case PermissionStatus.granted:
          AmapLocation.fetchLocation()
              .then((value) => HttpUtil.getInstance().doGet<WeatherEntity>(
//                    Api.weatherForecast + "/${value.city}",
                    Api.weatherForecast + "/佛山",
                    data: (data) => setState(() {
                      _weatherEntity = data;
                    }),
                  ));
          break;
        case PermissionStatus.undetermined:
        case PermissionStatus.denied:
        case PermissionStatus.restricted:
        case PermissionStatus.permanentlyDenied:
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
                title: Text("提示"),
                content: Text("权限不足！"),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("确定"))
                ]),
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Text("data");
}
