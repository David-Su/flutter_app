import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/http_util.dart';
import 'package:flutter_app/model/api.dart';
import 'package:flutter_app/model/entity/news_list_entity.dart';
import 'package:intl/intl.dart';

import 'model/entity/news_type_entity.dart'; // 需要在 pubspec.yaml 增加该模块

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageWidget();
}

class _MainPageWidget extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  String text = "demo";

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    HttpUtil.getInstance().doGet<List<NewsTypeEntity>>(Api.newsTypes,
        data: (data) {

          log(data.runtimeType.toString());

      HttpUtil.getInstance().doGet<List<NewsListEntity>>(Api.newsList,
          params: {"typeId": data[0].typeId,"page": 1}, data: (List<NewsListEntity> data) {
            log(data[0].title);
          });

    });


  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("当前时间"),
        ),
        body: TabBarView(
            controller: tabController,
            children: <Widget>[Text(text), Text(text), Text(text), Text(text)]),
        bottomNavigationBar: Material(
          child: TabBar(
              controller: tabController,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.black54,
              tabs: <Tab>[
                Tab(text: "新闻", icon: Icon(Icons.home)),
                Tab(text: "新闻", icon: Icon(Icons.home)),
                Tab(text: "新闻", icon: Icon(Icons.home)),
                Tab(text: "新闻", icon: Icon(Icons.home))
              ]),
        ),
      );

  String getCurrTime() =>
      DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
}
